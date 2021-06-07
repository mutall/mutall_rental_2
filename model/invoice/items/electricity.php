<?php
namespace invoice;

/*
This class manages electricity charges, to Mutall clients, computed from 
Kenya Power bills, or estimated from our own local readings. The last option is
not implemented yet. For KPLC billing, the following figure represents possible 
billing scenarios, where:-
ui = the i'th unposted billing date
pj = the j'th posted billing date
c = the cutoff date, i.e., the last day of the current invoice period.

Figure 1: Bill posting  scenarions
 
-----v---v---v----------v---------------v---------v----------v-------p--
     u1  p1  u2         p2              u3        c          u4      p3

Question: what is the bill to charge the client for period c, u1..u4?
 
Intuitively, it is u3, where:- 
1. the bill is unposted, so it cannot be any of the pi's
2. the billing date is:-
    a. below or equal to to the cutoff, so u4 is out, leaving [u1, u2, u3]
    b. the highest below the cutoff date
    c. higher than p2 where p2 is a posted bill with the highest date below
       the cutoff -- if p2 exists.
Bill u3 may be divided between a number of clients, depending on whether it is 
shared or not, to arrive at a, the amount to be charged. The charge is 0 if 
there is not sharing, as these clients pay directly to Kenya power

To simplify the logic for selecting teh appropriate bill to charge at any time,
we assume that if a bill is bosted, the all the raelier unposted ones will 
be marhes as posted. This means that in figure 1, bills u1 and u2 would all have
been flagged as posted because they are earlier than p2
*/
//
//Electricity is a billed binary item. This means a number of things:-
//a) Posting requires 2 operands: eaccount as the driver and elecricity as the
//  storage
//b) It is a time variant quantity where the ebill entity changes from month to
//month
class item_electricity extends item_binary{
    //
    public function __construct($record) {
        //
        parent::__construct($record, "eaccount", "electricity", "Electricity Charge");
   }
    
    //Let 'power' be a virtual entity that models the link between client and 
    //eaccount tables with client and eaacount as the identifisrs
    function power(){
        //
        //Consider only non-terminated agreemts
        $terminated = 
            "agreement.terminated is not null "
            . "and agreement.terminated <'{$this->record->invoice->cutoff()}'";
            
        //An agrrement is futristic if the stating date is greate then the cuoff
        $futuristic = "agreement.start_date>'{$this->record->invoice->cutoff()}'";    
        //
        //An agreement is is valid when it is not terminated and it is marked
        //as valid (which by default it is)
        $valid_agreement = " not ($terminated) and agreement.valid and not ($futuristic)";
        //        
        //
        return $this->chk(
            //    
            //Note the distinct keyword to remove room details
            "select distinct "
                //
                //identifiers of the virtual power entity
                . "client.client, "
                . "eaccount.eaccount, "
                //
                //For debugging
                . "client.name, "
                //
                //Raw data for sharing electricity; the sharing is per room, if 
                //the contribution share not given
                . "if(econnection.share is null, 1, econnection.share) as share "
            . "from "
                //
                //This links a client to a eaccount via the room assumming the 
                //mutall rental data model
                . "client "
                . "inner join agreement on agreement.client=client.client "
                . "inner join room on agreement.room = room.room "
                . "inner join econnection on econnection.room = room.room "
                . "inner join emeter on econnection.emeter=emeter.emeter "
                . "inner join elink on elink.emeter=emeter.emeter "
                . "inner join eaccount on elink.eaccount = eaccount.eaccount "
            . "Where "
                //
                //Only valid agreements are considered
                . " $valid_agreement "
                //
                //Consider active, i.e., not closed, meters only.
                ."and econnection.end_date>= '{$this->cutoff()}'"
       
        );
    }
    
    //Use the power entity to find the number of electricity connections for a 
    //client in order to highlight invalid power provisions; those are cases 
    //where (a) there is more than one connection and (b) there is no connection.
    //(b) is invalid because all mutall clients use power
    function connections(){
        //
        return $this->chk(
            //Note the distinct keyword to move room details
            "SELECT "
                //
                //Primary that extends the client table; if a left join to the
                //clien table yields a null, that would be an ilegal connection
                . "power.client, "
                //
                //It is an error if this number is more than 1
                . "count(power.eaccount) as `count`"
            . "FROM "
                //
                //Drive this process using the power entity
                 ."({$this->power()}) as power "
            . "GROUP BY "
                . "power.client "
        );
    }
    
    //Use the power entity to establish membership, the number of clients 
    //sharing an account.
    function membership(){
        //
        return $this->chk(
            "SELECT "
                //This subquery extends an eaccount
                . "power.eaccount, "
                //
                //Sum up all the shares. The client's contributin is share/count
                . "sum(power.share) as total_share, "
                //
                //Count the number of mebers sharing an account
                . "count(power.client) as count "
            . "FROM "
                //
                 ."({$this->power()}) as power "
            //             
            . "GROUP BY "
                . "power.eaccount "
            
        );
    }
      
    //Returns the last unposted bill date. This is from the ebill with the 
    //highest date that is below cutoff. Take care of partial posting, so that 
    //even after current posting, we get the same result.
    function last_unposted_date(){
        //
        return $this->chk(
            //Note the distinct keyword to move room details
            "SELECT "
                //
                //Select the maximum due date for a bill
                . "max(ebill.due_date) as value, "
                //
                //The eaccount is also needed for accessing the bill that 
                //matches the highest due date 
                . "power.eaccount "
            //    
            . "FROM "
                //
                //Power models the link between client and eaccunt
                . "({$this->power()}) as power "
                    //
                    //The ebill that is under consideration
                . "inner join ebill on ebill.eaccount = power.eaccount "
                //
                //Add a left join for supporting the posted condition below
                . "left join ({$this->current_invoice()}) as invoice on "
                    . "invoice.client = power.client "
            . "WHERE "
                //All bills must be below cutoff date,depending on whether we are
                //monitoring or invoicing clients.        
                . "ebill.due_date<='{$this->operational_cutoff()}'"
               //
               //Consider the unposted cases, taking care of partial posting
                . "and not (". table::posted('ebill').") "
            . "GROUP BY "
                . "power.eaccount"
            
        );
    }
    
    //Returns the last unposted ebill as the one with the last posted date
    function last_unposted_bill(){
        //
        return $this->chk(
            "SELECT "
                //
                //Rteurn all fields from ebill
                ."ebill.* "
            . "FROM "
                //
                //This is the ebill we whch we wich to return
                ."ebill "
                //
                //Select the last unposted  date for a eaccount
                . "inner join ({$this->last_unposted_date()}) as last_date on "
                //
                //Consider all the identification conditions for a single ebill to 
                //be returned, hence the double join. This is why the eaccount 
                //is required on the posted subquery.
                    . "last_date.value = ebill.due_date  "
                    . "and  last_date.eaccount = ebill.eaccount"
        );
    }
      
    //Returns an sql for that reports on all electricity records that have been
    //posted for the current period. This query will be used for determining 
    //power entries that have not been posted (through a left join) for teh 
    //periodt.
    function posted_items(){
        //
        return $this->chk(
            "SELECT "
                //
                //The primary key
                ."electricity.electricity, "
                
                //The storage indentifiers, except period
                ."electricity.eaccount, "
                ."invoice.client "
            ."FROM "
                //
                //The electricity table stores the posted electricity charges
                . "electricity "
                //
                //Ensure that the returned electricity records are for current period
                ."inner join ({$this->current_invoice()}) as invoice on "
                    . "electricity.invoice = invoice.invoice "
        );
    }
    
    //Returns the sql for displaying and posting electricity charges in the 
    //current period. The following entities are used:-
    //a) eaccount as the query driver
    //b) electricity as the poster storage
    //c) ebill as the the time variant entity that is used for calculating the 
    //charges and and which must also be as posted. 
    //Thus electricity is a (time variant) binary item
    function detailed_poster($parametrized=true, $postage=true){
        //
        //Compute the amount to be shown on the clients invoice, i.e., 
        //payable to Mutall for every client. 
        $charge = 
            //This applies only to shared ebills    
            "if(membership.count > 1 "
            //
            //Charge per client for cases of sharing
            . ", ebill.current_amount*(power.share/membership.total_share) "
                 //
            //Nonsharing clients pay directly to kplc
           . ", null) ";
        //
        //Formulate the sql
        $sql = $this->chk(
        "select "
            //
            //Message fields for communicating the invoice data to client
                //
                //Report acccount an meter details
                ."eaccount.num as eaccount_no, "
                ."emeter.num as emeter_no, "
                . "emeter.new_num as new_emeter_no, "
                //
                //Amount to pay Kenya power for the the account
                ."ebill.current_amount as payable_to_kplc, "
                //
                //Include the date when payment is due
                . "ebill.due_date, "
                //
                //Sharing ratio: No. of clients sharing a bill. 
                ."concat(power.share, '/', membership.total_share) as sharing, "
                //
                //Amount to pay to mutall
                ."$charge as amount, "
                //
            //Primary and foreign keys to support billed binary items. 
                //
                //Direcly or indirectly, the driver must supply the client field
                //which is primarily used for (spporting (a) parametrizing the
                //sql and (b) posting the results where a client invoice
                //is always needed
                ."power.client, " 
                //
                //Add the elecricity storage identifier beyond period and 
                //invoice. Generally, the driver entity always contributes its 
                //primary field key to support updates (for unary items) or 
                //inserts (for binary cases) of storage entities
                ."eaccount.eaccount, "
                //
                //For time-variant situations, we need to track the entity that 
                //was used for calculations. In the is case it is the ebill. Hence
                //its primary key. It is needed for marking the ebill as [posted
                ."ebill.ebill  "
        //        
        ."from "
            //
            //The driver of of elecricity is eaccount
            ."eaccount "
            //
            //Bring in the client indirectly via a virtual entitu, power
            ."inner join ({$this->power()}) as power on "
                . "power.eaccount = eaccount.eaccount "
            //
            //Using left joins bring in joins to support reporting
            //
            //Bringing in membership, i.e.,  of clients,  per eaccount
            . "left join ({$this->membership()}) as  membership on "
                . "membership.eaccount = eaccount.eaccount "
            //
            //Bringing in the most recent unposted ebill
            . "left join ({$this->last_unposted_bill()}) as  ebill on "
                . "ebill.eaccount = eaccount.eaccount "
            //
            //Add support for testing of unposted electricity items for the
            //current period.        
            ."left join ({$this->posted_items()}) as electricity on "
                //
                //Unique identifies of electricity except invoive.period, because
                //we assume posted electricity is for current period
                . "electricity.eaccount = eaccount.eaccount "
                . "and electricity.client = power.client "
            //
            //Add Extra joins for reporting emeter amd eaccount details
                //
                //Link emeter to the eaccount, through elink
                ."inner join elink on elink.eaccount=eaccount.eaccount "                
                //
                //To support reporting of emeter details
                ."inner join emeter on emeter.emeter = elink.emeter "
        . "where "
            //
            //Bring in the parametrized client constraint if it is needed. It is
            //if the request is for a specific client
            .($parametrized? "power.client = :driver ": "true ")
            //
            //Add the postage constraint, if requested. 
            . "and " . ($postage ? "electricity.electricity is null " : "true ")
            
            
        );
       //
       //Return the sql
       return $sql;
    }
    
    //Posting electricity charges involves the following operations for the 
    //current period:-
    //a) creating the electricity charge record using a referenece bill
    //b) linking ref bill to the invoice
    //c) linking all unposted bills ealier than the ref to the invoice
    function post(){
        //
        //Create the current electricity charge record. This seems to affect the
        //the posting of other related cases, e.g., linking the ebill to the
        //invoice, linking all ebils earlier than the ereference to the invoice
        //of the reference. INVESTIGATE
        $this->dbase->query(
            "insert into "
                //
                //The table records being created; teh fields will be derived 
                //from  the sql that generates the data. This makes this query
                //generalisable.
                . "electricity ( "
                    //
                    //The messages
                    . "eaccount_no, emeter_no, payable_to_kplc, sharing, due_date, "
                    . "amount, "
                    //
                    //The identifiers of electricity
                    ."eaccount, invoice "
                    //
                    //Needed for tracking the ebill used fr posting this 
                    //electricity
                    //. "ebill_ebill "
                . ") "
                //
                . "(select "
                    //Retrieve the messages; there is no need to qualify the fields
                    ."eaccount_no,emeter_no,payable_to_kplc,sharing,due_date, "
                    . "amount, "
                    //
                    //The identifiers of electricity
                    ."poster.eaccount, invoice.invoice "
                ."from "
                    //
                    //The source of non-parametrized and all electricity 
                    //charges
                    . "({$this->poster()}) as poster "
                    //
                    . "inner join ({$this->current_invoice()}) as invoice "
                        . "on invoice.client=poster.client) "
                    //        
            . "on duplicate key update "
                    . "eaccount_no=values(eaccount_no), "
                    . "emeter_no=values(emeter_no), "
                    . "due_date=values(due_date), "
                    . "payable_to_kplc=values(payable_to_kplc), "
                    . "sharing=values(sharing), "
                    . "amount=values(amount)"
        );
        //
        //The following postings seem to be afftected by the fact that
        //we have already posted the ebill. Investigate the better way to do it.
        //Link the reference bill to the invoice. Resist the tempation 
       //to simultaneously link the earlier ones, because there is no gurantee 
       //that there will be any! And that would cause the refence not to be 
       //linked             
        $this->dbase->query(
            "update "
                //
                //The update will on a electricity bill
                . "ebill "
                //
                //Ensure that we use the poster query that has no prefix and 
                //no constraint
                . "inner join ({$this->detailed_poster(false, false)}) as poster on "
                    //
                    //Ensure that the we bill we intend to update is the one we 
                    //posted used for postng the charge
                    ."  ebill.ebill = poster.ebill "
                //
                //Retrieve the electricity record that matches this ebill. You 
                //have to account for all the identification fields of 
                //electircity: invoice and eaccount
                //
                //Start with the current invoice, that has to be consistent 
                //with the ebill's client
                ."inner join ({$this->current_invoice()}) as invoice "
                    . "on invoice.client = poster.client "
                
            . "set "
                . "ebill.invoice = invoice.invoice "   
        );             
                    
        //Link the bills earlier than the reference one to the same elecricity
        //charge as the reference one.
        $this->dbase->query(
            "update "
                //
                //Let ref be the reference bill
                . "ebill as ref "
                //
                //The reference bill can be found from the poster sql
                //
                //Let e be the source of non-parametrized and all postable (not 
                //just  unposted) electricity charge. It has the ebill that 
                //was used for caclulating the charge
                . "inner join ({$this->detailed_poster(false, false)}) as e on "
                    //
                    //Ensure that the reference is the one we used for the
                    //caculating the charges
                    ."ref.ebill = e.ebill "
                //
                //Let earlier be any unposted bill earlier than the reference one
                . "inner join ebill as earlier "
                    //We are talking about the same account as that of the 
                    //reference
                    . "on earlier.eaccount = ref.eaccount "
            //
            //Set the earlier bill link to the same as thtat of the reference one
            ."set "
                . "earlier.invoice = ref.invoice "    
            . "where "
                    //The earlier bill must be unposted 
                    . "earlier.invoice is null "
                    //
                    //Its date must be consitent with the reference one    
                    . "and earlier.due_date < ref.due_date "
        );
        //        
    }
    
    //Debugging of elecrtcity posting
    function debug_post(){
        //
        return $this->dbase->chk(
        //
        "select earlier.* "
        . "from "
                //
                //Let ref be the reference bill
                . "ebill as ref "
                //
                //The reference bill can be found from the poster sql
                //
                //Let e be the source of non-parametrized and all postable (not 
                //just  unposted) electricity charge. It has the ebill that 
                //was used for caclulating the charge
                . "inner join ({$this->detailed_poster(false, false)}) as e on "
                    //
                    //Ensure that the reference is the one we used for the
                    //caculating the charges
                    ."ref.ebill = e.ebill "
                //
                //Let earlier be any unposted bill earlier than the reference one
                . "inner join ebill as earlier "
                    //We are talking about the same account as that of the 
                    //reference
                    . "on earlier.eaccount = ref.eaccount "
            //
            //Set the earlier bill link to the same as thtat of the reference one
            //."set "
            //    . "earlier.invoice = ref.invoice "    
            . "where "
                    //The earlier bill must be unposted 
                    . "earlier.invoice is null "
                    //
                    //Its date must be consitent with the reference one    
                    . "and earlier.due_date < ref.due_date "
        );
    }
    
    //Unposting electricty charges reverses the posting process. It:-
    //- disconnects all ebills linked to a electricity charges, i.e., echarge
    //- removes the echarge record
    function unpost(){
        //
        //Disconnect the ebills linked to the current invoice 
        $this->dbase->query(
            "update "
                //
                //Its the ebills we are disconnecting
                ."ebill "
                //
                //Determine if to disconnect just the current ones or all of tthem,
                .($this->record->invoice->current 
                    ? 
                      //Yes disconnect only the current ones  
                      "inner join ({$this->current_invoice()}) as invoice on invoice.invoice= ebill.invoice "
                    //
                    //Disconnect everything  
                    :"")
            //
            //By resetting the echarge link    
            . "set "
                . "ebill.invoice = null"    
        );
        //
        //Remove the electricity charges -- by calling the parent unpost
        parent::unpost();        
    }
    
}

