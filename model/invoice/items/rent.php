<?php
namespace invoice;

//This class supports management of rental income for monthly and quarterly 
//paying clients. This item is the main source of Mutall income, so special 
//care needs to be taken to calculate it as accurately as possible, particularly 
//when planned adjustments are due.
//
//The drivers for this item are the signed agreements that are room specific
//The other entities needed to support rental charge calculations are:-
//- client(start_month, ...)
//- rent(client, agreement, amount, invoice)
//
//Wen posted, the link to the current period invoice is establisshed
class item_rent extends item_binary {
    //
    public function __construct($record) {
        //
        parent::__construct($record, "agreement", "rent", "Rental Charge");
        //
        //Rent is paid in advance when it is due.
        $this->advance=true;
    }
    //Returns the sql for posting rental income. The income is charged room by 
    //room, according to a written agreement. The month when the rent paying 
    //was started is specified at the client level, rather than room level,
    //so that even for multiple rooms, the payment is done as a lumpsum.
    //
    //Once posted, a rent record is created and is linked to the current invoice
    function detailed_poster($parametrized=true, $postage=true){
        //
        //Compute the rent conversion factor, e.g., 1 for monthly paying clients,
        //3 for quarterly paying clients when due and null for non-due cases.
        //
        //Quarterly clients pay after every 3 months, so they pay 3 times their
        //monthly rent on the fall of each quarter and null otherwise.
        //
        //The fall of a quarter occurs when..
        $fall = "((month(agreement.start_date) - {$this->record->invoice->month}) %3) = 0";
        //
        $quarterly = "if ($fall, 3, null)";
        //
        //Monthly clients have a payment factor is 1
        $factor = "if(client.quarterly,  $quarterly, 1)";
        //
        //Compute the rental period; its same as current period for monthly 
        //paying clients; otherwise it is the next 3 months, starting from 
        //current month
        //
        //Get the first day of the current period as a string
        $firstday ="{$this->record->invoice->year}-{$this->record->invoice->month}-1"; 
        //
        //A local function to return the month name of the n'th month from the 
        //first day of current period.
        $month = function($n) use ($firstday){
            //
            //Get the date, $n months from the first day of of current period 
            $date_str = "$firstday + $n month";
            //
            //Convert date string to a unix time object
            $date = strtotime($date_str);
            //
            //Return the short month name of the 
            return date("M", $date);
        };
        //
        //Join the next 3 months        
        $month3 = "{$month(0)}, {$month(1)}, {$month(2)}";                
        //
        //For quaterly clients if the quarter is due return the next 3 months;
        //otherwise return the current one
        $period = "if(client.quarterly and ($fall), '$month3', '{$month(0)}')";        
        //
        return $this->chk(
            "select "
                //
                //The client foreign key is used for computing closing balances
                . "agreement.client, "
                //
                //The agreement to used for implementing future postings
                ."agreement.agreement, "
                //
                //Messages
                //
                //The room number
                ."room.uid as room_no, "
                //
                //The rental amount as agreened in the contract.
                . "agreement.amount as price, " 
                //
                //The computation factor is neeed
                ."$factor as factor, "
                //
                //The rental period: same as current period for monttly clients, 
                //else the next 3 months, starting from current month
                . "$period as rental_period, "
                //
                //The rental amount payable for the current invoice period
                . "agreement.amount * ($factor) as amount "
                
            //    
            ."from "
                //Rent is driven by agreements. 
                . "agreement "
                //
                //Add a join to support testing of unposted agreements for current 
                //period
                . "left join ({$this->posted_items()}) as rent "
                    //
                    //Rent has 2 (field) identifiers: invoice and agreement
                    //invoice has 2: period and client
                    //agreement has 2: client and room. So excluding period, the
                    //required join is only one, agrrement
                    . "on rent.agreement=agreement.agreement "
                //
                //We require access to client data, e.g., start month of 
                //rental payment
                ."inner join client on agreement.client=client.client "
                //
                //To support reporting of room details
                . "inner join room on agreement.room = room.room "
            ."where "
                //
                //Apply the client parameter if necessary
                //Constrain this poster sql to some client parameter
                .($parametrized ? "agreement.client = :driver " : " true ")
                //
                //Exclude toillets and other non-rented rooms
                ."and agreement.amount is not null "
                //
                //Add the rent postage constraint, if requested. If requested, 
                //the postage constraint allows us to see only those cases that 
                //have not been posted. This is teh case when  there is no rent 
                //object that points to the driving agreement for this period         
                . "and " . ($postage ? "rent.agreement is null " : "true ")
                //
                //Please respect the agreement termination date.
                ." and agreement.terminated is null "
                //
                //Exclude future contracts
                ." and agreement.start_date>={$this->cutoff()} "              
            //
            //order by date of agreement so that the earliest agreement comes
            //to fore, for use in computing distress condition. Use the bigger 
            //amounts of the available amounts
            . "order by agreement.start_date, agreement.amount desc "
        );        
    }
    
    
    //Returns an sql that reports on posted rental charges posted for the current 
    //invoice period. This query is used to identifying unposted agreements
    //Returns the sql that helps us to test if a auto-generated item exists
    //in the storage table for the current periods. It returns:-
    //a) the primary key to the item, to be used in a null test
    //b) identification fields to be used in a left join a poster driver in 
    //order to isolate null cases
    function posted_items(){
        //
        return $this->chk(
            //    
            "select "
                //The primary key used in a null test,e.g., storage.storage is not null
                ."rent.rent, "
                //
                //key_storage_identifiers
                //The field used to fully identify a rent, excluding invoice.period, 
                //is rent.agreement -- obtained from the driver
                ."rent.agreement "
            ."from "
                //
                //The driver for tis item, e.g., service, rent, electricity,
                //water, closing_balane, etc
                ."rent "
                //
                //The storrage invoice must be the same as the current one, so 
                //that this query returns the posted cases for the current period
                ."inner join ({$this->current_invoice()}) as invoice "
                    . "on rent.invoice = invoice.invoice "
                
        );
    }
    
    //
    //Report detailed rent
    function detailed_report($parametrized = true) {
        //
        return $this->chk(
            //    
            "select "
                ."room.uid as room_no, "
                . "room.title as room_name, "
                . "agreement.amount as price, "
                . "rental_period, "
                . "rent.factor, "
                . "rent.amount "
            . "from "
            //
            //The storage table drives the reporting
                . "rent "
                . "inner join agreement on rent.agreement=agreement.agreement "
                . "inner join room on agreement.room=room.room "
            . "where "
                //
                //Add the invoice constraint, if needed.
                . ($parametrized ? "$this->storage.invoice =:driver " : "true ")
                
            //
            //Order by start date so that the realiest agreement's rental value
            //is used for calculating distress conditions      
            ."order by agreement.start_date"    
        );
    }

    
    //Posting rent, a binary item, generally involves creating new records in 
    //the rent, i.e., storage, table. Rent is a static item, so tme -variant 
    //entiries are involved in calculating it.
    function post(){
        //
        return $this->query(
        //
        //Create the rent records to be posted...
        "insert into "
             //     
            . "rent ("
                //
                //Specify the message field names. 
                //.$this->select->messages->names
                ."room_no, price, rental_period, "
                . "factor, amount, "
                //
                //Specify all the rent identifier names
                //.$this->storage->identifiers->names
                ."agreement, invoice "
            . ")"
             //
             // Select ...
             . "(select "
                // 
                //The poster fields to match the desired messages supply the data.
                //The comma will be ignored if there are no message datas 
                //. $this->messages->data
                ."room_no, price, rental_period, "
                . "factor, poster.amount, "
                //
                //List the data soureces of all the storage identifiers, except invoice
                //These must all be supplied by the poster.
                //.$this->storage->identifiers->data.", "
                ."poster.agreement, "
                //
                //The (current) invoice primary key is needed by all storage
                //tables
                . "invoice.invoice "
            . "from "
                 //Data come from this items's poster sql, with the following 
                 //conditions:-
                 //
                 //a) No parametrized client constraint is needed for posting the generated,
                 //because database CRUD operations are designed to work with multiple
                 //records.
                 //
                 //b) Noooo....Only unposted data is considerd, so, the postage constraint needs to 
                 //be set. We will be using an insert statement, so existing records should
                 //be excluded
                 . "({$this->poster()}) as poster "
                 //
                 //Bring in current invoice table. This is not a loose join as we
                 //need to match driver and poster clients. At this point, we assume 
                 //it that the current invoice is already posted.
                 . "inner join ({$this->current_invoice()}) as invoice on "
                     //
                    //The invoice and the poster are linked by client. This is
                    //one of the reasons why client must be a poster field. The
                    //other reason has do to with summarizing closing balance
                    . "invoice.client = poster.client "
                    //
                    //Bring in the agreement to support the order by clause (and we
                    //don't want to show it n the report)
                   ."inner join agreement on agreement.agreement=poster.agreement "                   
                //
                //Order the inserted data by the agreement start date, so that the 
                //earliest agreement is used as the basis for computing distress
                //conditions         
                . "order by agreement.start_date "
            . ") "
            . "on duplicate key update "
                . "room_no=values(room_no), "
                . "price=values(price), "
                . "rental_period=values(rental_period), "
                . "factor=values(factor)"     
        );        
    }
    
}
