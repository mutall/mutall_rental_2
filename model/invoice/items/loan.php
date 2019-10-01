<?php
namespace invoice;
//
//
//This class is created to support the management of rental arrears by clients.
//In the event that the client has outstanding rental arrears, Mutall will
//loan (carry forward the rental arrears) to subsequent months where the client
//will be required to make monthly payments to clear up their rental arrears.
class item_loan extends item_binary{
    //
    public function __construct($record) {
        //
        parent::__construct($record, 'loan' ,'repayment', 'Loan_Amount');
    }
    
    //This sql returns the sum of all the repayments that have been made and 
    //have not been posted.
    function sum_repayments(){
        //
        return $this->chk(
            "select "
                //
                //identifiers for the repayment
                ."repayment.loan, "
                //
                //the amounts repaid
                ."sum(repayment.amount) as summed "
                //
            ."from "
                //
                //The repaid amounts are driven by the repayment table
                ."repayment "
                //
                //inner join the loan to help with grouping
                ."inner join loan on repayment.loan=loan.loan "
                
            ."where "
                ." repayment.invoice is null "
            //
            //Group the repayments by the loan being paid
            ."group by "
                . "loan.loan "

            );
    }
    //
    //Returns the sql for payments made for a given client
    function autopayment(){
        //
        return $this->chk(
            "select "
                //
                //the payments made
                . "sum(payment.amount) as amount, "
                //
                //loan being paid
                . "loan.loan "
                //
                //
            . "from "
                //
                //payments are stored in the payment table
                . "payment "
                //
                //bring in the client to get the agreement
                . "inner join client on payment.client=client.client "
                //
                //bring in the agreement to get to the loan
                . "inner join agreement on agreement.client=client.client "
                //
                //bring in the loan table
                . "inner join loan on loan.agreement=agreement.agreement "
                //
                //
            . "where "
                //
                //ensure that only payments that have not been posted are considered
                . "payment.invoice is null "
                //
                //group the payments by the client paying
            . "group by "
                //
                //
                . "client.client "
        
        );
    }
    //
    //Return the sql that generates the loan amount to be re-paid by the client.
    //It displays the loan repayment amount for the current period
    //for loaned clients. The loan table drives the item and the data is stored
    //in 2 tables: the repayment and the accumulator.
    function detailed_poster($parametrized=true, $postage=true){
        //
        //Total repayments for the period (upto cuotff(-1)
        $repayments ="if(repayments.summed is null, 0, repayments.summed)";
        //
        //Acummulated total repayments
        $accumulated ="if(accumulator.total is null, 0, accumulator.total)";
        //
        //Current loan balanace
        $balance="(loan.amount - $accumulated - $repayments)";
        //
        //Planned or expecte monthly repayment
        $rate="(loan.amount/loan.instalment)";
        //
        //The loan charge to appear on the invoice, taking into acount that the
        //client may have made direct repayments in whic case the charge is 
        //different from the rate
        $charge="if($balance<$rate && $balance>0, $balance, $rate)";
        //
        //Calculate auto repayment
        $autorepayment ="if($rate>autopayment.amount, autopayment.amount, $rate)"; 
        //
        //Work out the total repaid loans 
        $gross_repayments="($repayments+$autorepayment+$accumulated)";
        //
        return $this->chk(
            "Select "
                //
                //The foreign key used in calculating the closing balance
                . "agreement.client, "
                //
                //for future posting we need the agreement and the loan identifiers
                ."loan.loan, "
                . "agreement.agreement, "
                //
                //The messages to be posted to the client.
                //
                // Loan start_date
                ."loan.start_date, "
                //."$rate as amount "
                //
                //Loaned amount
                ."loan.amount as loaned_amount, "
                //
                //the total amount of loan paid
                . "$gross_repayments as total_paid, "
                //
                //the principle amount to be paid
                . "$charge as amount, "
                //
                //Calculate the amount auto-repaid
                 ."$autorepayment as autorepayment, "
                //
                //the repaid amounts during the month
                . "repayments.summed as paid_this_month, "
                //
                //the loan balance remaining
                ."$balance as balance "
            . "From "
                //the loan is driven by the loan table
                . "loan "
                //
                //Access to te client via the agreement
                //        
                . "inner join agreement on loan.agreement=agreement.agreement "
                //
                //add the repayment accumulator details
                . "left join accumulator on accumulator.loan=loan.loan "
                //
                //Add a left join to check for unposted loans
                . "left join ({$this->posted_items()}) as posted_items "
                    //
                    //repayment has 3 (field) identifiers: agreement, loan, the
                    //invoice period. Agreement is identified by the client, room
                    //invoice is identified by the client and period
                    //and the loan is identified by the repayment and its start_date
                    //so excluding the invoice, add the agreement 
                    . "on posted_items.loan=loan.loan "
                
                 //
                //Bring in sum of repayments to support balance calculation        
                . "left join ({$this->sum_repayments()}) as repayments on "
                    . "repayments.loan = loan.loan "
                        
                //To support calculationa for auto-repayments
                ."left join ({$this->autopayment()}) as autopayment on "
                . "autopayment.loan=loan.loan "        
                //
            . "Where "
                 //Constrain this poster sql to some client parameter
                .($parametrized ? "agreement.client = :driver " : " true ")
                //
                //Add the repayment postage constraint, if requested. If requested, 
                //the postage constraint allows us to see only those cases that 
                //have not been posted. This is the case when  there is no repayment 
                //object that points to the driving loan for this period         
                . "and " . ($postage ? "posted_items.invoice is null " : "true ")
                //
                //Exclude cases outside of the boundaries
                //
                //The cutoff date has to be less thanthe loan date
                ."and '{$this->cutoff(0)}'>loan.start_date "
                //
                //and the balance has to be more than zero
                . "and $balance>0 "
            );
    }
    //
    //Check posted data on the repayment table. 
    //This querry returns an sql that reports on posted repayment amount posted for the current 
    //invoice period. 
    //This querry will help note unposted repayments
    function posted_items(){
        //
        return $this->chk(
            //    
            "select "
                //
                //The repayment primary key used in a null test,e.g., 
                //storage.storage is not null. Also include its identifiers and 
                //postage fields. 
                //As such select everything in the repayment table
                ."repayment.* "
                //
            ."from "
                //
                //The loan repayment postage item is driven by the repayment table
                ."repayment "
                //
                //Ensure the storage invoice is similar to the current one.
                //This is important in ensuring that only the posted cases are
                //returned by this querry
                ."inner join ({$this->current_invoice()}) as invoice "
                    . "on repayment.invoice = invoice.invoice "
                
        );
    }
     //
    //report detailed loan
    function detailed_report($parametrized = true) {
        //
        return $this->chk(
            //    
            "select "
                . "loan.amount as amount,"
                . "loan.start_date as start_date, "
                . "accumulator.total as total_paid "
            //
            . "from "
            //
            //reporting is driven by the storage
                . "loan "
                //
                //bring in the accumulator table for its details
                . "inner join accumulator on accumulator.loan=loan.loan "
                //
                //Repayment is the storage table. Bring it in for the parametrization
                ."inner join repayment on repayment.loan=loan.loan "
                //
            . "where "
                //
                //Add the invoice constraint, if needed.
                . ($parametrized ? "repayment.invoice =:driver " : "true ")
                
            //
            //Order by start date so that the realiest agreement's loaned value
            //is used for calculating distress conditions      
            ."order by loan.start_date "    
        );
    }
    
    //
    //Repayment is a binary item meaning its driver and storage are different
    //Posting repayment includes the creation of new records on the repayment
    //table.
    function autorepaid() {
        //
        return $this->query(
        "Insert into "
                . "repayment ("
                //
                //Specify the message field names. 
                ."date, amount, "
                //
                //identifiers for the repayment 
                ." loan, invoice "
            . ")"
                //
                //Select
                . "(select "
                // 
                //The poster fields to match the desired messages supply the data.
                ."poster.start_date, poster.autorepayment as amount, "
                //
                //Apart from the invoice include all the identifiers for the repayment
                //
                //list the loan table
                ."poster.loan, "
                //
                //All storage tables need the primary key of the invoice being stored
                . "invoice.invoice "
            . "from "
                //
                //The poster sql drives the storage. so retrieve data from it
                . "({$this->poster()}) as poster "
                //
                //Assuming the current invoice is already posted, include the table 
                //to match the driver and the poster clients.
                . "inner join ({$this->current_invoice()}) as invoice on "
                    //
                   //The invoice and the poster are linked by client. This is
                   //one of the reasons why client must be a poster field. The
                   //other reason has do to with summarizing closing balance
                   . "invoice.client = poster.client "
            . ") "
            . "on duplicate key update "
                . "date=values(date), "
                . "amount=values(amount) "
            );
        
    }
    //Loan repayment includes the actual payment and the accumulator.
    //This sql posts the accumulated paid amount and the loan charge of any given loan 
    function gross_payments(){
        //
        //Keep track of the amount paid. This is the total of the of the amount 
        //posted/paid by the client. also keep track of the loan charge/principle
        //charge on the loan
        return $this->query(
            "Insert into "
                . "accumulator ("
                //
                //Specify the message field names. 
                ."total, charge, "
                //
                //identifiers for the repayment_accumulator 
                ."loan, invoice "
            . ")" 
        //
                //Select
                . "(select "
                // 
                //The poster fields to match the desired messages supply the data.
                ."poster.total_paid, poster.amount, "
                //
                //Apart from the invoice include all the identifiers for the accumulator
                //
                //list the loan table
                ."poster.loan, "
                //
                //The (current) invoice primary key is needed by all storage
                //tables
                . "invoice.invoice "
            . "from "
                //
                //This item's data is driven by the poster sql. 
                . "({$this->poster()}) as poster "
                //
                //We need the current invoice to match the driver with the repaying
                //client
                . "inner join ({$this->current_invoice()}) as invoice on "
                //
                //Bring in the client linking the repayment its invoice
                . "invoice.client = poster.client "
            . ") "
                //
                //Update duplicate keys
                . "on duplicate key update "
                . "total=values(total), "
                . "charge=values(charge) "
            );  
    }
    function post(){
         //follow that with posting the gross amounts paid
        $this->gross_payments();
        //
        //first post the amounts paid automatically
        $this->autorepaid();
        //
       
    }
    //
    //unpost the loans posted. first ensure 
    function unpost(){
        //
        //Unpost the repayment bit using the normal unpost
        parent::unpost();
        //
        //Unlink the posted totals from the invoices
        $this->query(
            "update "
                //
                //we are interested in the accumulator table
                . "accumulator "
                //
                //Bringing in the current invoice -- if necessary
                .(
                    $this->record->invoice->current
                    ? "inner join ({$this->current_invoice()}) as invoice "
                        . "on accumulator.invoice = invoice.invoice "
                    :""        
                )        
            . "set "
                . "accumulator.invoice=null "
        );
        
    }
   
};