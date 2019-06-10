<?php
namespace invoice;

//
//This class supports management of the water resource. We have two sources of 
//water:borehole and fresh; their charges are calculated differently. A client
//can be supplied from multiple sources, so multiple meters is a possibility --
//unlike the case of electricity. For metered clients, water charges are 
//automatically generated from meter readings. Non-metered clients are handled
//as a service, just like securiry and gabbage collection -- so they are handled
//by the servive item class
class item_water extends item_binary{
    //
    public function __construct($record) {
        //
        //Service charge is not an aesthetic item because it is used for computng
        //closing balances
        parent::__construct($record, "wconnection", "water", "Water Consumption");
    }
    
    
    //Returns that sql that displays and posts water charges for the current period
    //for metered clients. The driver is water connection and the auto-generated 
    //data from meter readings is stored in the water table
    function detailed_poster($parametrized=true, $postage=true){
        //
        $diff = "(curr.value - prev.value)";
        //        
        //Define quantity of water consumed, nullifing negative cases
        $qty = "if($diff<0, null, $diff)";
        //
        return $this->chk(
            "select "
                //
                //Keys
                //    
                //The client foreign key field , needed for :-
                //a) calculating closing balances by grouping
                //b) innerr joining the generated data to current invoice 
                //  for posting purposes. 
                . "wlink.client, "
                //
                //Extra identifiers of the storage beyond client and period.
                //This method :-
                //(a) has to be aware of which identfiers are in the messages 
                //)b)has to exclude the client field since its already there          
                ."wconnection.wconnection, "
                //
                //Messages
                //
                //The water meter being read
                ."wmeter.serial_no as serial_no, "
                ."wmeter.name, "
                //
                //The most recent psoted is the previous date...
                ."prev.date as prev_date, "
                //
                //..and its associated value is the previous reading
                ."prev.value as prev_value, "
                //
                //The most recent unposted date is the current date...
                ."curr.date as curr_date, "
                //
                //and rge current reading is the matching value
                ."curr.value as curr_value, "
                //
                //Consupmption is the positive differenece between readings. 
                //It is null if any of them is null
                ."$qty  as consumption, "
                //
                //The charge rate -- which is meter dependent. The borehole water 
                //has a different rate from vendor supplied one.
                ."wconnection.rate, "
                //
                //Compute the consumption
                ."wconnection.rate * $qty as amount, "
                //
                //Add the water reading primary key for use as a referece during
                //posting
                . "curr.wreading "
            //    
            . "from "
                //This process is driven by water connections, as it is valid for
                //metered clients only
                ."wconnection "
                //
                //Extend the driver to allow calculations of water consumption
                //
                    //Add a distinct link from water connection to client through
                    //room and agreement
                    ."inner join ({$this->wlink()}) as wlink on "
                        . "wlink.wconnection = wconnection.wconnection "
                
                    //Add the previous reading in the current period
                    . "left join ({$this->prev_reading()}) as prev on "
                        . "prev.wconnection = wconnection.wconnection "
                    //
                    //Add the current reading in the current period
                    . " left join ({$this->curr_reading()}) as curr on "
                        . "curr.wconnection = wconnection.wconnection "
                 //
                //We need to determine unposted water charges. 
                . "left join ({$this->posted_items()}) as storage on "
                . "storage.wconnection = wconnection.wconnection "
                //
                //Bring in extra joins for supporting the wmeter based messages
                . "inner join wmeter on wconnection.wmeter = wmeter.wmeter "
            //  
            //Add the varous constraints            
            . "where "
                //        
                //Apply the client parametrized constraint, if requested        
                . ($parametrized ? "wlink.client = :driver ": "true ")
                //
                //Consider active, i.e., not closed, meters only. Partially 
                //read meters, i.e., those closed but not posted are still valid,
                //------------------------------------------------------------
                //        |        x         |                   |
                //     cutoff(-2)       cutoff(-1)           cutoff(0) 
                //The meter closed at time x, i.e., enddate>cutoff(-2) is still 
                //valid        
                ."and wconnection.end_date> '{$this->cutoff(-2)}' "
                //
                //Add the postage constraint, if requested. 
                . "and " . ($postage ? "storage.water is null " : "true ")
        );
    }
    
    
    //Returns the sql for reporting on previous reading. It is the highest dated
    //unposted reading below the cutoff for any water connectiion
    function prev_reading(){
        //
        return $this->chk(
            "select "
                //This is a water connection exension; so the connection primary 
                //key wil be needed
                ."wconnection.wconnection, "
                //
                //We need to report on the date and value of the water reading
                ."wreading.date, "
                ."wreading.value, "
                //
                //Wgich formula was use for calculating previous date
                . "date.formula "
            . "from "
                //
                //The process is driven by water connection
                ."wconnection "
                //
                //The target join requires access to water reading date, so 
                //bring in wreading
                ."inner join wreading on wreading.wmeter=wconnection.wmeter "
                //
                //Get eh highest posted date below cuoff for a water connection
                //This is the target join; it has a double join
                . "inner join ({$this->prev_date()}) as date "
                    . "on date.wconnection = wconnection.wconnection "
                    . "and date.value = wreading.date"
        );
    }
    
    //Returns the date of the previous reading
    function prev_date(){
        //
        //There eare 2 versions of  previous reading --- depending on whether
        //this is a new or old connection
        //
             $sql = $this->chk(
            "select "
                . "wconnection.wconnection, "
                //
                //Retuens the dat of an old client if valie, otherwise assume
                //the client is new
                . "if(old_date.value is not null, old_date.value, new_date.value) as value, "
                //
                //Show which formular
                ."if(old_date.value is not null, 'old', 'new') as formula "
            . "from "
                . "wconnection "
                //
                //Date for an existing, i..e., old,  connection
                . "left join ({$this->old_prev_date()}) as old_date on "
                    . "old_date.wconnection = wconnection.wconnection "
                //
                //Date for a new water connection
                . "left join ({$this->new_prev_date()}) as new_date on "
                    . "new_date.wconnection = wconnection.wconnection "
        );
        //
        return $sql;
        
    }
    
    //Returns the previous date of a water readings for an old connection
    function old_prev_date(){
        //
        $sql = $this->chk(
            "select "
                //We will be grouping by water connection. There is no direct 
                //connection between a water connection and a reading in 
                //Mutall Rental. This is not thecase with Eureka Waters.
                ."wconnection.wconnection, "
                //
                //The desired date comes from the water reading
                . "max(wreading.date) as value "
            ."from "
                //
                //The process is driven by the water connection
                . "wconnection "
                //
                //You need access to the water reading
                //
                //wmeter is an intermediate link
                . "inner join wmeter on wconnection.wmeter=wmeter.wmeter "
                //
                //Now we can bring in the water reading
                . "inner join wreading on wreading.wmeter=wmeter.wmeter "
                //
                //Add a link to the client to support the curent invoice
                . "inner join ({$this->wlink()}) as wlink "
                //
                //Add the current invoice bit to support tests for partial posting
                . "left join ({$this->current_invoice()}) as invoice "
                    . "on invoice.client = wlink.client "
            ."where "
                //
                //Ignore future readings (that may be in the database)
                ."wreading.date<='{$this->operational_cutoff()}' "
                //
                //Consider only posted water readings...
                . "and ".table::posted('wreading')." "
            ."group by "
                //        
                //The grouping is by the driver, the water connection
                . "wconnection.wconnection "
        );
        //
        //
        return $sql;        
    }
    
    //Returns the previous date of a water readings for an new client, i.e., one
    //for which we have never had any posting. It is the minimum reading between
    //current and previous cutoffs
    function new_prev_date(){
        //
        $sql = $this->chk(
            "select "
                //We will be grouping by water connection. There is no direct 
                //connection between a water connection and a reading in 
                //Mutall Rental. This is not thecase with Eureka Waters.
                ."wconnection.wconnection, "
                //
                //The desired date comes from the water reading
                . "min(wreading.date) as value "
            ."from "
                //
                //The process is driven by the water connection
                . "wconnection "
                //
                //You need access to the water reading
                //
                //wmeter is an intermediate link
                . "inner join wmeter on wconnection.wmeter=wmeter.wmeter "
                //
                //Now we can bring in the water reading
                . "inner join wreading on wreading.wmeter=wmeter.wmeter "
                
            ."where "
                //
                 //The reading is between the current and previous/previous cuoffts,
                //, depending on whether we are monitoring or invoicing clients.
                ."wreading.date<='{$this->operational_cutoff()}' "
                //
                //previous/previous cutoff
                . "and wreading.date>='{$this->cutoff(-2)}' "
            ."group by "
                //        
                //The grouping is by the driver, the water connection
                . "wconnection.wconnection "
        );
        //
        //
        return $sql;        
    }
    
    
    //Returns the sql for reporting on current reading. It is the highest dated
    //unposted reading below the cutoff for any water connectiion
    function curr_reading(){
        //
        return $this->chk(
            "select "
                //This is a water connection exension; so the connection primary 
                //key wil be needed
                ."wconnection.wconnection, "
                //
                //The water reading primary key is needed for linking tgis 
                //time-variant quantity to the current invoice
                . "wreading.wreading, "
                //
                //We need to report on the date and value of the water reading
                ."wreading.date, "
                ."wreading.value "
            . "from "
                //
                //The process is driven by water connection
                ."wconnection "
                //
                //The target join requires access to water reading date, so 
                //bring in wreading
                ."inner join wreading on wreading.wmeter=wconnection.wmeter "
                //
                //Get eh highest posted date below cuoff for a water connection
                //This is the target join; it has a double join
                . "inner join ({$this->curr_date()}) as date "
                    . "on date.wconnection = wconnection.wconnection "
                    . "and date.value = wreading.date"
        );
    }
    
    //Returns the current date of a water readings. It is the highest unposted
    //date below cutoff for a water connection.  
    //reference date.
    function curr_date(){
        //
        //A reading is stale, if:-
        $stale = 
            //Its connection has a valied last posting date    
            "last_posted_date.value is not null "
            //
            //..that is greater than that of the reading
            ."and last_posted_date.value > wreading.date";
           
        //
        $sql = $this->chk(
            "select "
                //We will be grouping by water connection. There is no direct 
                //connection between a water connection and a reading in 
                //Mutall Rental. This is not thecase with Eureka Waters.
                ."wconnection.wconnection, "
                //
                //The desired date comes from the water reading
                . "max(wreading.date) as value "
            ."from "
                //
                //The process is driven by the water connection
                . "wconnection "
                //
                //wmeter is an intermediate link
                . "inner join wmeter on "
                    . "wconnection.wmeter=wmeter.wmeter "
                //
                //Now we can bring in the water reading
                . "inner join wreading on "
                    . "wreading.wmeter=wmeter.wmeter "
                //
                //Add a link to the client to support the curent invoice
                . "inner join ({$this->wlink()}) as wlink on "
                . "wlink.wconnection = wconnection.wconnection "
                //
                //Add the current invoice bit to support tests for partial posting
                . "left join ({$this->current_invoice()}) as invoice "
                    . "on invoice.client = wlink.client "
                //
                //Add the join for isolaing stale readings        
                . "left join ({$this->last_posted_date()}) as last_posted_date on "
                    ."last_posted_date.wconnection = wconnection.wconnection "
            ."where "
                //
                 //Ignore future readings (that may be in the database), 
                 //depending on whether we are monitoring or invoicing clients.
                ."wreading.date<='{$this->operational_cutoff()}' "
                 //
                 //Consider only unposted water readings...
                 . "and not (".table::posted('wreading').") "
                //
                //...that are not stale        
                . "and not ($stale) "
            ."group by "
                //        
                //The grouping is by the driver, the water connection
                . "wconnection.wconnection "
        );
        //
        //
        return $sql;        
    }
    
    
    //Returns the sql that helps us to test if a water connection has been
    //posted or not for the current period and client.
    function posted_items(){
        //
        return $this->chk(
            "select "
                //
                //The primary key
                ."water.*, "
                //
                //We will require a field for left joining to the water 
                //connection as well as for null testing
                ."invoice.client "
            ."from "
                //
                //Posted water charges are stored in the water table
                ."water "
                //
                //  invoice lins water with period
                . "inner join ({$this->current_invoice()}) as invoice on "
                    . "water.invoice = invoice.invoice "
                
        );
    }
    
    //
    //Retuens a distainck set of client/wconnetiopn combination, usng the 
    //client/agreement/room/wconnection path
    function wlink(){
        return $this->chk(
            "select distinct "
                . "client.client,"
                . "wconnection.wconnection "
            . "from "
                . "client "
                . "inner join agreement using(client) "
                . "inner join room using(room) "
                . "inner join wconnection using (room)"    
        );
    }
    
    //Posting water, a binary item, involves 3 operations:-
    //a) creating new records in the storage, i.e., water, table
    //b) linking the time-variant entity, water reading, a.k.a., ref, to the invoice
    //c) linking all water readings below the reference to the same invoice as the
    //reference
    function post(){
        //
        $this->query(
        //
        //Create the water records to be posted...
        "insert into "
            //     
            . "water ("
                //
                //Specify the water message field names
                //.$this->messages->names
                ."serial_no, prev_date, curr_date, curr_value, "
                ."prev_value, consumption, rate, amount,"
                //
                //
                //Specify all the waater storage identifier names.
                //.$this->storage->identifiers->names 
                ."wconnection, invoice "
            . ")"
            //
            // Select from the oster and current invoice
            . "(select "
                // 
                //The poster fields to match the desired messages supply the data.
                //The comma will be ignored if there are no message datas 
                //. $this->messages->data
                ."serial_no, prev_date, curr_date, curr_value, "
                ."prev_value, consumption, rate, amount,"
                //
                //List the data sources of all the water identifiers, except invoice
                . "poster.wconnection, "
                //
                //The (current) invoice primary key is needed by all storage
                //tables
                . "invoice.invoice "
             . "from "
                 //Data come from this items's poster sql, with the following 
                 //conditions:-
                 //
                 //a) No parametrized client constraint is needed for posting the 
                 //generated, because database CRUD operations are designed to 
                 //work with multiple records.
                 //
                 //b) All data is considerd, so, the postage constraint needs to 
                 //be ignored; we will take care of duplicates
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
                    . "invoice.client = poster.client) "
        . "on duplicate key update "
            . "serial_no = values(serial_no), "
            . "prev_date = values(prev_date), "
            . "curr_date = values(curr_date), "
            . "curr_value = values(curr_value), "
            . "prev_value=values(prev_value),"
            . "consumption =values(consumption), "
            . "rate = values(rate), "
            . "amount = values(amount)"     
        );
        //
        //Link the time-variant entity, water reading, a.k.a., ref, to the 
        //current invoice
        $this->query(
            //
            //This is an update of water readings
            "update "
                . "wreading "
                //
                //Bring in the water poster without the psotage constratin; it 
                //has the reference water reading.
                //
                . "inner join ({$this->poster(false)}) as ref on "
                    . "ref.wreading = wreading.wreading "
                //
                //Bring in the current invoice to link to        
                . "inner join ({$this->current_invoice()}) as invoice on "
                    //
                    //The invoice and the poster are linked by client. This is
                    //one of the reasons why client must be a poster field. The
                    //other reason has do to with summarizing closing balance
                    . "invoice.client = ref.client "
            ."set wreading.invoice = invoice.invoice"            
        );
        //
        //Mark all unposted water readings below the reference as posted to the
        //current invoice
        $this->query(
            //
            //This operation updates the water readings
            "update "
                . "wreading "
                //
                //Bring in the reference water reading, without the postage constraint
                . "inner join ({$this->poster(false)}) as ref on "
                    . "ref.wreading = wreading.wreading "
                //
                //Bring in the current invoice to link to        
                . "inner join ({$this->current_invoice()}) as invoice on "
                    //
                    //The invoice and the poster are linked by client. This is
                    //one of the reasons why client must be a poster field. The
                    //other reason has do to with summarizing closing balance
                    . "invoice.client = ref.client "
            //
            ."set wreading.invoice = invoice.invoice "
            //
            //Only unposted water readings dated below the reference are 
            //considered            
            . "where "
                . "wreading.invoice is null "
                . "and wreading.date<ref.curr_date"
                
        );        
    }
    
    //Unpost water, includes unlinking of readings (used to post the water) from
    //the current invoice
    function unpost(){
        //
        //Unpost the water bit using the generalized version
        parent::unpost();
        //
        //Unlink the posted water readings from their invoices
        $this->query(
            "update "
                //
                //Its the water reading table we are interested in
                . "wreading "
                //
                //Bringing in the current invoice -- if necessary
                .(
                    $this->record->invoice->current
                    ? "inner join ({$this->current_invoice()}) as invoice "
                        . "on wreading.invoice = invoice.invoice "
                    :""        
                )        
            . "set "
                . "wreading.invoice=null "
        );
        
    }
    
    //The last posted date of any connectin is the maximum date available
    //for any unposted reading
    function last_posted_date(){
        //
        $sql = $this->chk(
            "select "
                //We will be grouping by water connection. There is no direct 
                //connection between a water connection and a reading in 
                //Mutall Rental. This is not thecase with Eureka Waters.
                ."wconnection.wconnection, "
                //
                //The desired date comes from the water reading
                . "max(wreading.date) as value "
            ."from "
                //
                //The process is driven by the water connection
                . "wconnection "
                //
                //The target join requires access to water reading date, so 
                //bring in wreading
                ."inner join wreading on wreading.wmeter=wconnection.wmeter "
                //
                //Add a link to the client to support the curent invoice
                . "inner join ({$this->wlink()}) as wlink on "
                . "wlink.wconnection = wconnection.wconnection "
                //
                //Add the current invoice bit to support tests for partial posting
                . "left join ({$this->current_invoice()}) as invoice "
                    . "on invoice.client = wlink.client "
            ."where "
                //
                 //Ignore future readings (that may be in the database)
                ."wreading.date<='{$this->cutoff()}' "
                 //
                 //Consider only the posted water readings...
                 . "and ".table::posted('wreading')." "
            ."group by "
                //        
                //The grouping is by the driver, the water connection
                . "wconnection.wconnection "
        );
        //
        //
        return $sql;        
    }
    
}
