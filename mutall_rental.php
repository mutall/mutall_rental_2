<?php

require_once '../library/library.php';
//
//The library of core mutall PHP classes
//Start a mutall session if not yet strated
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

//The meutall rental website
class mutall_rental extends page_home {

    //creating the constructor for this class
    function __construct() {
        //
        //creating the qstring for the construction
        //
        $qstring = new querystring();
        //
        parent:: __construct($qstring, 'mutall_rental', 'mutallco_rental');
    }

    //Execute a client-specified requested
    function execute_request() {
        //
        $dbase = $this->dbase;
        //
        //Retrieve the request
        if (isset($this->arr['request'])) {
            //
            $request = $this->arr['request'];
            //
            switch ($request) {
                //
                //Save sms sent by android to the msg table
                case "push_msg_to_server":
                    //
                    //Create a message object
                    $msg = new msg();
                    //
                    //
                    //Get the posted message as a json string
                    $jsonmsg = $this->arr['msg'];
                     //
                    //Save all the posted messages and export them to ebills
                    $msg->save_all($jsonmsg);
                   //
                    echo "Ok";
                    break;
                //
                //Send sms to KPLC based on the named job
                case "send_sms_2kplc":
                    //
                    //Get the name of the job
                    $jname = $this->arr['job'];
                    //
                    //Retrieve the sql;
                    $stmt = $dbase->query("
                        select
                            job.sql
                        from
                            job
                        where
                            job.name='$jname'
                    ");
                    //
                    $result = $stmt->fetch_assoc();
                    //
                    if (!$result) {
                        throw new Exception("Job $jname not found");
                    }
                    //
                    $jobsql = $result['sql'];
                    //
                    //Selecting all that match the retrievd sql
                    $fsql = $dbase->chk("
                        select
                            '95551' as kplc,
                            eaccount.num as sms
                        from
                            eaccount inner join
                            ($jobsql) as jobsql on jobsql.eaccount = eaccount.eaccount
                    ");
                    //
                    $jobstmt = $dbase->query($fsql);
                    //
                    $jresult = $jobstmt->fetchAll();
                    //
                    $fresult = json_encode($jresult);

                    echo $fresult;
                    //
                    break;
                //
                //Output the lovina ebill as a json for consumption by a client
                case "lovinah_ebill":
                    //
                    //Create an ebill
                    $ebill= new ebill();
                    //
                    echo $ebill->get_lovinah_json();
                    break;
                //
                //Test the message push
                case "test":
                    //
                    $ebill = new ebill();
                    $ebill->test();
                    break;
                //    
                default:
                    //Execute requests defined by the parent
                    parent::execute_request();
            }
        } 
        else {
            header("location:home.php");
        }
    }

}

//
//The water field extends the Buis (driver) field by:-
//(a)adding a water wreading property 
//(b)overriding the __toString() function so that it retuns the value string 
//property rather than the sql xvalue property
//(c) addding a set value property; this is not defined for field, thus making
//it abstract
//
//(Note that a single field is the smallest (page) driver; then a driver_record; then a 
//driver sql, etc)
abstract class field_water extends driver_field {

    //
    //This need to be protected to avoild recursion (because field_water is 
    //a property of wreading)
    protected $wreading;

    //
    function __construct($name, wreading_record $wreading) {
        //
        $this->wreading = $wreading;
        //
        //Initualize the buis field
        parent::__construct($name);
        //
        $this->set_value();
    }

    //The string nrepresentation on of a water column is its value
    function __toString() {
        //
        //If the value is not set, return a zero lenth string; its got to be a
        //string!!
        return isset($this->value) ? (string) $this->value : "";
    }

}

//The water colum is an extension of the field water with the fact that that
//the value of the field can be set from the water wreading's record using
//the column's name
class column_water extends field_water {

    //
    //Initialize the inherited water colum
    function __construct($name, wreading_record $wreading) {
        //
        //Initialize the parent water
        parent::__construct($name, $wreading);
    }

    //Set the value of a field from the water wreading
    function set_value() {
        //
        //The value setting is conditional
        $fname = $this->name;
        //
        //get teh recrod driving this page
        $record = $this->wreading->driver;
        //
        //Return if the values are not set
        if (!isset($record->values)) {
            return;
        }
        //
        //If the named value is not set, return
        if (!isset($record->values->$fname)) {
            return;
        }
        //
        //Oherwise set the value
        $this->value = $record->values->$fname;
    }

}

class wmeter_column extends column_water {
    //
    //The primary key id of the water meter column will ned to be exported 
    //to javascript environment; the setting is done on set_value()
    public $primarykey;
    //
    //Initialize the inherited water colum
    function __construct(wreading_record $wreading) {
        //
        parent::__construct('wmeter', $wreading);
        //
    }

    //Set the values of a foreign key field
    function set_value() {
        //
        //Get the record for the water wreading
        $record = $this->wreading->driver;
        //
        //Get the subfields of this field
        $subfields = $record->fields[$this->name]->subfields;
        //
        //Let p be the primary key field name
        $p = $subfields->primary->name;
        //
        //Set the primary key field property
        if (isset($record->values->$p)) {
            $this->primarykey = $record->values->$p;
        }
        //
        //Let o be the output field
        $o = $subfields->output->name;
        //
        //Set the value component of teh foreign kety as the output subfeld
        if (isset($record->values->$o)) {
            //
            //Set teh value of this field
            $this->value = $record->values->$o;
        }
    }

}

//
//The last wreading is an extension of a field with a date property
class last_wreading extends field_water {

    //
    //Date of last wreading
    public $date;
    //
    //Statement to retrieve the last wreading; it need not be exported
    protected $stmt;
    //
    //The following variables are bound to the statement parameters
    //
    //The current/reference date string
    protected $current_date;
    //
    //The water meter primary key value
    protected $wmeter;

    //
    //The last wreading can be called from javascript
    function __construct(wreading_record $wreading) {
        //
        //Initialize the inherited Buis field
        parent::__construct('last_wreading', $wreading);
    }

    //Set teh value of teh last wreading
    function set_value() {
        //
        //Set the statement for retrieving the last wreading
        //
        //Get the database that is drving the water wreading and derive a new 
        //connection. Do not re-use the main connection driving water-wreadings --
        //otherwise if we dont go out of sync if we dont do proper closing of
        //opened statements
        $dbname = $this->wreading->driver->dbase->dbname;
        $db = new dbase(page_login::password, page_login::username, $dbname);
        //
        //The last wreading for each water meter is the one read on highest one 
        //date below the current/reference date
        $last = $db->chk("
            select
                wmeter.wmeter, 
                max(wreading.date) as maxdate
            from
                wreading inner join
                wmeter on wmeter.wmeter=wreading.wmeter
            where
                wreading.date < ? and
                wmeter.wmeter = ?
            group by 
                wmeter.wmeter    
        ");

        //Prepare the sql that returns the date and value of the last wreading
        $this->stmt = $db->prepare("
            select
                wreading.date,
                wreading.value
            from
                wreading inner join
                ($last) as last_wreading on 
                    wreading.date=last_wreading.maxdate and
                    wreading.wmeter=last_wreading.wmeter
        ");
        //
        //Bind the paramaters to the reference date and meter's primary key id 
        $this->stmt->bind_param("ss", $this->current_date, $this->wmeter);
        //
        //Bind the result to the date and value of the wreading
        $this->stmt->bind_result($this->date, $this->value);
        //
        //Get the curent date
        $date = $this->wreading->current_date->value;
        $wmeter = $this->wreading->wmeter->primarykey;
        //
        //Bind the date and value
        $this->execute_and_fetch($date, $wmeter);
        //
        //Close the statement so the buffer can be re-used
        //$this->stmt
    }

    //Execute the fetch
    function execute_and_fetch($date, $wmeter) {
        //
        //Bind the parameters
        $this->current_date = $date;
        $this->wmeter = $wmeter;
        //
        //Execute the last wreading statement
        $this->stmt->execute();
        //
        //If no data is found, set the date and wreading values to null
        if (!$this->stmt->fetch()) {
            //
            $this->value = null;
            $this->date = null;
        }
    }

}

//Water consumption extends a water column by doing a calculation and returning
//its sttaus
class consumption extends field_water {

    //
    public $status;

    //
    //Initialize the inherited water colum
    function __construct(wreading_record $wreading) {
        //
        //Initialize the inherited field
        parent::__construct('consumption', $wreading);
    }

    //Potentially this can be used in an ajax call
    function set_value() {
        //
        //Get current and previous water wreadings
        $r1 = $this->wreading->current_wreading->value;
        $r0 = $this->wreading->last_wreading->value;
        //
        //Set calculation to null if wither of the calculations is null
        //
        if (is_null($r0)) {
            $c = null;
        } elseif (is_null($r1)) {
            $c = null;
        } else {
            $c = $r1 - $r0;
        }
        //
        $this->value = $c;
        //
        //Set the consuption error status
        if ($c < 0) {
            $this->status = "error";
        } elseif ($c === null) {
            $this->status = "null";
        } else {
            $this->status = "ok";
        }
    }

}

//The water wreading
class wreading extends page_records {

    //
    function __construct() {
        //
        //Construct a new querystring from the global variables
        $qstring = new querystring();
        //
        //Water wreading is based on the equivalent table
        $qstring->arr['tname'] = 'wreading';
        //
        //Specify the sorting order
        $qstring->arr['order_by'] = 'date desc, wreading desc';
        //         
        //Initialize the parent page_record
        parent::__construct($qstring);
    }

    //Override the page records driver to get a view suitable for monitoring
    //water consumption
    function get_driver() {
        //
        //Open the database, to allow us check the queries that follow
        $dbase = new dbase(page_login::username, page_login::password, $this->dbname);
        //
        //Select the previous date for every water wreading
        $wreading_prev_date = $dbase->chk("
            SELECT 
                wreading.wreading, 
                wreading.wmeter, 
                Max(previous.date) AS last_date
            FROM 
                wreading INNER JOIN 
                wreading AS previous ON wreading.wmeter = previous.wmeter
            WHERE 
                previous.date<wreading.date
            GROUP BY 
                wreading.wreading, 
                wreading.wmeter
        ");
        //
        //Select the previous value for every wreading, plus other support data
        //for obtain the previous wreading for every current wreading
        $wreading_prev = $dbase->chk("
            SELECT 
                wreading.value AS last_value,
                wreading_prev_date.wreading, 
                wreading_prev_date.last_date 
            FROM 
                ($wreading_prev_date) as wreading_prev_date INNER JOIN 
                wreading ON (wreading_prev_date.last_date = wreading.date) 
                            AND (wreading_prev_date.wmeter = wreading.wmeter)
        ");
        //
        //Use the current and previous value for every wreading to compute the
        //current consumption. Include the last date ana value for reporting
        //purposes
        $consumption = $dbase->chk("
            SELECT 
                wreading.wreading, 
                wreading_prev.last_date, 
                wreading_prev.last_value, 
                wreading.value - last_value AS value
            FROM (
                wreading LEFT JOIN 
                ($wreading_prev) as wreading_prev ON wreading.wreading = wreading_prev.wreading)
        ");

        //Collect the fields needed for reporting, ensuring that the user can 
        //provide some selection criteria and or sorting order. This means 
        //that these clauses cannot be part of this sql
        $report = $dbase->chk("
            SELECT 
                wreading.wreading, 
                wreading.date, 
                wmeter.serial_no,
                wmeter.wmeter as `wmeter.wmeter`,
                wmeter.name, 
                consumption.last_date, 
                consumption.last_value, 
                wreading.value, 
                format(consumption.value, 0) AS consumption
            FROM (
                wreading LEFT JOIN 
                ($consumption) as consumption ON wreading.wreading = consumption.wreading) inner join
                wmeter ON wmeter.wmeter = wreading.wmeter
        ");
        //
        return new driver_sql($dbase, $report);
    }

}

//A water reading page is an extension of a Buis' page_record
class wreading_record extends page_record {
    //
    //The table name that this class is based on
    public $tname = "wreading";
    //
    //The water meter associated with this wreading
    public $wmeter;
    //
    //The current/reference date to be used for retrieving the last wreading
    public $current_date;
    //
    //The current wreading value/column
    public $current_wreading;
    //
    //The last wreading (both date and value)/object 
    public $last_wreading;
    //
    //The consumption/object
    public $consumption;

    //A water wreading record constructor
    function __construct() {
        //
        //Construct a new querystring from the global variables
        $qstring = new querystring();
        //         
        //Initialize the parent page_record
        parent::__construct($qstring);
        //
        //Set the initial property values of a water wreading record
        //
        //Set the current wreading date to the field named date
        $this->current_date = new column_water('date', $this);
        //
        //If the reference date is not known then it is today.
        if (!isset($this->current_date->value)) {
            $this->current_date->value = date("Y-m-d");
        }
        //
        //Set the wreading value to the field named wreading
        $this->current_wreading = new column_water('value', $this);
        //
        //Set the water meter property to a new wmeter column
        $this->wmeter = new wmeter_column($this);
        //
        //Set the last wreading and consumption fields
        $this->last_wreading = new last_wreading($this);
        $this->consumption = new consumption($this);
    }

    //
    //Returns the last wreading value and its date, given the reference 
    //date and the primary key value of the water meter. Note the paramaters are
    //optional with null values to allow us to pass them via the querystring
    //when this function is called via ajax
    function get_last_reading($current_date = null, $wmeter = null) {
        //
        //Set the reference date value from  either the argument or the querystring;
        $d = is_null($current_date) ? $this->arr['date'] : $current_date;
        //
        //Set the meter primary key; --ditto -- ref datecalue
        $w = is_null($wmeter) ? $this->arr['wmeter'] : $wmeter;
        //
        //Execute teh last wreading statement
        $this->last_wreading->execute_and_fetch($d, $w);
        //
        return $this->last_wreading;
    }

}

class ebill extends page_record {
    
    public $eaccount_report;
    //
    //
    public $emeter_report;
    //
    //Message formats for e-bills as a stdClasss object read off a json file.
    // The format's stucture example is:-
    //  
    //{kplc:[f1,f2,f3...], 95551:[f4,f5,f6...]}
    //
    //where fi is a field that has the following structure
    
    //{name:x, storage:y, vts:[z1,z2]}
    //
    //The storage, y is an entity/attrubute pair, e.g., {entity=e, attribute=a}
    //and zi's, are variable text separators between fields in the mesage format
    public $formats;
    //
    //Construct the ebill instance
    function __construct() {
        //
        //Compile a querystring
        $qstring = new querystring();
        //
        //Add the database name to the querystring
        $qstring->arr['dbname'] = 'mutallco_rental';
        $qstring->arr['tname'] = 'ebill';
        //
        //Construct the parent using a querystring
        parent::__construct($qstring);
        //
        $this->set_lovinah_sql();
        //
        $this->set_gloria_sql();
        //
        //Set the message formats from the json text files
        $this->formats = $this->get_formats();
    }
    
    function test(){
        //
        //Compile teh test meaaage
        $msg = "Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743227. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 2289 Prev Read: 2269,Billed Units: 20KWh,   Fixed charge: 0, Cons.units amount:249.3 Fuel Cost and Levies: 65.91,Taxes: 40.79, Adjustments";
        //
        //Assume the kpl message
        ///
        //Use the name to select the variable text separated valuaes pattern
        $pattern = $this->formats->kplc;
        //            
        //Extract the data from the mesage field
        $data = $this->get_data($msg, $pattern);
        //
        //Save the data to the ebill table; remember to link teh ebill to 
        //the message
        //$this->save_data($data, pattern, $msg);               
    }
    
    //Returns the message formats for e-bills from a saved json file. The format 
    //srtuctire example is 
    //{kplc:[f1,f2,f3...], 95551:[f4,f5,f6...]}
    //where fi is a field structire that has ths strutier example
    //{name:x, storage:y, vts:[z1,z2]}
    //The storage, y is strucries as {entity=e, attribute=a}. zi are variable text
    //separartors between fields in the mesage format
    function get_formats(){
        //
        //Get the e-bill formats from externalfile
        $content = file_get_contents("ebill.json");
        //
        //Convert it to php std class data and return it
        return  json_decode($content);
    }
    
    //Save all the received ebill-messages to this ebill table. The msg has the 
    //(javascript) format:-
    //{format:"kplc", messages:[m1, m2, ...]}
    //assuming that all messages, mi's,  sent in a batch has the same format 
    function save_all($batch){
        //
        //Get theh name of the format to use, kplc or 9551.
        $name = $batch->format;
        //
        //Use the name to select the variable text separated valuaes pattern
        $pattern = $this->formats->$name;
        //
        //Loop throug all the actual messages and save them one by one guided by
        //the  pattern
        foreach($batch->messages as $message){
            //
            //Extract the data from the mesage field
            $data = $this->get_data($message, $pattern);
            //
            //Save the data to the ebill table; remember to link teh ebill to 
            //the message
            $this->save_data($data, pattern, $message);
        }
    }
    
    //Retrieve the data from the given message and vtsv pattern. The pattern 
    //is a list of fields, where eacfield has teh structure
    //{name:"amt", storage:{entity:"e", attribute;"a"}, vtsv:["s1", "s2", ...]}
    //The returned data is an array of values indexed by teh field names
    function get_data($message, $pattern){
        //
        //Let $s be the starting point for message processing
        $s = 0;
        //
        //Start with an empty list of values
        $values = [];
        //
        //Step through all pattern fields
        for ($i = 0; $i < count($pattern); $i++) {
            //
            //Get the i'th value and set the starting point for next
            //itteration. Skip the field if not found????
            $value = null;
            //
            if ($this->try_value($i, $message, $pattern, $value, $s)){
                //
                $fname = $pattern[$i]->name;
                //
                //Collect the value;
                $values->$fname = $value;
            }
        }
        //
        //The return the requested data
        return $values;
    }
    
    //Retuen the message value for the i'th field by looking at the start of the
    //next field
    function try_value($i, $message, $pattern, &$value, &$offset){
        //
        //Let i1 and i2 be the current and next index positions, respectively
        $i1 = $i; $i2=$i+1;
        //
        //Let vtsv1 the field text whose position, p1, was fpind in the message
        $vtsv1 = null; $p1 = null;
        //
        //Match i1 and i2 to the message, reporting errors if the match cannot
        //be established
        if ($this->match($message, $pattern[$i1], $offset, $vtsv1, $p1)){
            //
            //
            //Let vtsv2 be the field text whose position, p2, was foind in the 
            //message
            $vtsv2 = null; $p2 = null;
            //
            //The first match has been found; do the 2nd
            if ($this->match($message, $pattern[$i2], $offset, $vtsv2, $p2)){
                //
                //Extract the field's value from teh messagee
                    //
                    //Get the start of the value
                    $pos = $p1 + strlen($vtsv1);
                    //
                    //The end of the value is $p2, so the lenth of the message is
                    $length = $p2 - $pos; 
                    //
                    //Retreve the value
                    $value = substr($message, $pos, $length);
                //
                //Advance the offset
                $offset = $p2 + strlen($vtsv2);
                //
                return true;
            }
        }else{
            return false;
        }
    }
    
    //Match the ith field ...te field has teh structure patterns...
    //{name:amt, storage:x, vtsv:[y1, y2, ...]}
    function match($message, $field, $offset, &$vtsv, &$p){
        //
        //Extract the variable text sepaated valeus
        $vtsvs = $field->vtsv;
        //
        //Try matching any of them
        foreach($vtsvs as $vtsv){
            //
            $p = strpos($message, $vtsv, $offset);
            //
            if ($p!==false){
                //
                //Match found. Return true
                return true;
            }
            else{
                //Match not found, continue the search
            }
        }
        //
        //Match not found at all
        echo "Unable to match field $field->name in message $message "
             . "at offset $offset";
        //
        return false;
    }
    
    //Write the given data to te database. The data is a lif of extracted values 
    //indexed by the field name.
    //The pattern has the syntax: 
    //  [{fname:x, storage:y, vtsv:z}, ...]
    //and the data is an array of values indexd by field name, e.g., 
    //  [fname=>value,...]
    function save_data($data, $pattern, $message){
        //
        //Get all the ebill data, attribute/value pairs
        $attrs = $this->get_ebill_attr($data, $pattern);
        //
        //Compile the ebill's eaccount foreign key field
        //
        //Let $eaccount be the primary key field value of the messages
        //eaccount   
        $eaccount = null;
        //
        //Retrieve the eaccount' primary key
        //
        //Get the account number
        $num =$data['eaccount']; 
        //
        //retrieve the eaccount primary key
        if (!$this->get_pk('eaccount', 'num', $num, $eaccount)){
            //
            echo "Eaccount in message $message found in database";
            return false;
        }
        //
        //Compile the ebill's msg foreign key field
        //
        //Let $msg be the primary key field value of the saved message
        $msg = null;
        //
        //Retrieve the message's primary key
        if (!$this->get_pk('msg',  'name', $message, $msg)){
            //
            echo "Message $message not found in database";
            return false;
        }
        //
        //Compile all the ebill fields, i.e., attributes and foreign key
        //fields
        $ebill_fields = array_keys($attrs);
        $fields = array_merge($ebill_fields, ['eaccount', 'msg']);
        //
        //Compile  all values, i.e., attrubutes and forengn key values
        $ebill_values = array_values($attrs);
        $values = array_marge($attrs, [$ebill_values, $msg]);
        //
        //Insert the e-bill
        $this->dbase->query(
           "insert "
                . "into e_bill ($fields)"
                . "values ($values)"
                . "on duplicate key update amount = values(amount) "     
        );
        //
        //Success
        return true;
    }
    
    //Get all the ebill data, as attribute/value pairs.
    //The pattern has the syntax: 
    //  [{fname:x, storage:y, vtsv:z}, ...]
    //and the data is an array of values indexd by field name
    //  [fname=>value,...]
    //The required ebill data has the syntax:-
    //  [attribute=>value, ...]
    function get_ebill_attr($data, $pattern){
        //
        //Start with no ebill attributes
        $attrs = [];
        //
        //Step through data's fname/value  pairs
        foreach($data as $fname=>$value){
            //
            //Look for the field in the pattern that matches the field name, 
            //assuming tha teh patern is indexd by field name
            $field = $pattern[$fname];
            //
            //Consider only those cases where the storage is valid, where valid 
            //means....
            $valid = isset($field->storage) && !is_null($field->storage);
            //
            //Check if the entities name is ebill
            if ($valid && $field->storage->entity=='ebill'){
                //
                //Retrieve teh attribute's name
                $attrname = $field->storage->attribute;
                //
                //Collect the attribute
                $attrs->$attrname = $value;
            }
        }
        //
        //Return the collected attributes
        return $attrs;
    }
    
    //Returns teh primary key of the requested entity given its attribute name and value
    function get_pk($entity, $attrname, $attrvalue, $pk){
        //
        //Query the database
        $results = $this->dbase->query(
            "select "
                . "$entity.$entity "
            . "from "
                . "$entity "
            . "where "
                . "$attrname='$attrvalue'"    
        );
        //
        //Fetch the data
        $result = $results->fetch();
        //
        if ($result){
            $pk = $result[0];
            //
            return true;
        }else{
            return false;
        }
    }
        
    //Add the save method
    function save() {
        //
        //Create the php values to save
        $values = new stdClass();
        //
        $values->current_amount = $this->myextract("AMOUNT: ", "Due on : ");
        //
        //Get the account name
        $account_num = $this->myextract("ACCOUNT: ", "NAME: ");
        //
        $values->eaccount = $this->get_primarykey($account_num);
        //
        $values->due_date = $this->myextract("Due on : ", "Thank you");
        //
        //Create the json values to save
        $jvalues = json_encode($values);
        //
        //Exploit the save values method
        $this->save_values($jvalues);
        //
        echo "Account num $account_num is saved successfully";
    }

    //
    //Extract teh demarcated data
    function myextract($w1, $w2) {
        //Simulate the message reception
        //$msg = "ACCOUNT: 29304136 NAME: PETER KARIUKI MURAYA AMOUNT: 522.05 Due on : 2018-05-24 THANK you EBill Kenyapower ";
        //
        //For development versions
        $msg = $this->arr['msg'];
        //
        //Let p1 be the position of the first word
        $p1 = strpos($msg, $w1);
        //
        //Let p2 be the first position of the field, i.e., start
        $p2 = $p1 + strlen($w1);

        //Calculate theh length of the field
        //
        //Let p3 be the start of the 2nd word, i.e., terminator
        $p3 = strpos($msg, $w2);
        //
        //The field length is the difference between the start and the terminator
        //one less.
        $l = $p3 - $p2 - 1;
        //
        //Retuen field value
        return substr($msg, $p2, $l);
    }

    //Returns teh primary key of the given eaccount number
    function get_primarykey($account_num) {
        //
        //Formulate an sql
        $sql = "
            select 
                eaccount 
            from 
                eaccount
            where num='$account_num'";
        //
        //Get the database that is driving this page
        $mysql = $this->driver->dbase;
        //
        //Execute teh sql
        $stmt = $mysql->query($sql);
        //
        //Fetch teh result--
        $result = $stmt->fetch_assoc();
        //
        //Throw an error if no account found
        if (!$result) {
            //
            throw new Exception("Account num $account_num not found");
        }
        //
        //return the account
        return $result['eaccount'];
    }
    
    function display_lovinah_report(){
    
        $sql = new sql($this->driver->dbase, $this->eaccount_report); 
        //
        //Specify display style
        $layout = new tabular();
        $mode = new mode_output();
        //
       $sql->display_data($this, $layout, $mode);
    }
    
    //
    function display_gloria_report(){
    
        $sql = new sql($this->driver->dbase, $this->emeter_report); 
        //
        //Specify display style
        $layout = new tabular();
        $mode = new mode_output();
        //
       $sql->display_data($this, $layout, $mode);
    }
    
    function set_lovinah_sql(){
        //
        $dbase = new dbase(page_login::password, page_login::username,$this->dbname);        
        //
        //the following sql main pupose is to extract the last date that we have
        //for any electricty bill 
        $eaccount_last_date = $dbase->chk("
            SELECT 
                ebill.eaccount, 
                Max(ebill.due_date) AS due_date
            FROM 
                ebill
            WHERE 
                not ebill.is_consumed
            GROUP BY 
                ebill.eaccount
        ");
        //
        //this sql depends on the  to pull out the values 
        //that much the last date
        $eaccount_last_value =$dbase->chk("
            SELECT 
                eaccount_last_date.eaccount, 
                ebill.due_date, 
                ebill.current_amount
            FROM 
                ($eaccount_last_date) as eaccount_last_date INNER JOIN ebill ON 
                (eaccount_last_date.due_date = ebill.due_date) AND 
                (eaccount_last_date.eaccount = ebill.eaccount)
        ");
        //
        //
        $this->eaccount_report = $dbase->chk("
            SELECT 
                eaccount.num,
                emeter.name, 
                eaccount_last_value.due_date, 
                eaccount_last_value.current_amount
            FROM 
                (eaccount INNER JOIN 
                ($eaccount_last_value)as eaccount_last_value ON eaccount.eaccount = eaccount_last_value.eaccount) INNER JOIN 
                (emeter INNER JOIN elink ON emeter.emeter = elink.emeter) ON 
                eaccount.eaccount = elink.eaccount
            WHERE 
                eaccount_last_value.current_amount>0
        ");
       
    }
    
    function set_gloria_sql(){
        //
        $dbase = new dbase(page_login::password, page_login::username,$this->dbname);        
        //
        //Extract the last date that we have a bill for each account 
        $eaccount_last_date =$dbase->chk("
            SELECT 
                ebill.eaccount, 
                Max(ebill.due_date) AS MaxOfdue_date
            FROM 
                ebill
            WHERE 
                (((ebill.is_consumed)=False))
            GROUP BY 
                ebill.eaccount
             ");
        //
        //Extract the the most recent bill
        $ebill_most_recent = $dbase->chk("
            SELECT 
                ebill.ebill
            FROM 
                ebill inner join
                ($eaccount_last_date) as eaccount_last_date on  
                    (eaccount_last_date.MaxOfdue_date = ebill.due_date) AND 
                    (eaccount_last_date.eaccount = ebill.eaccount)
            where
                ebill.current_amount>0
            ");
        //
        //Get shared accounts
        //
        //
        $eaccount_client= $dbase->chk("
            SELECT DISTINCT 
                eaccount.eaccount, 
                agreement.client
            FROM((((
                eaccount inner join
                elink on elink.eaccount = eaccount.eaccount) inner join 
                emeter on emeter.emeter = elink.emeter) inner join
                econnection on econnection.emeter = emeter.emeter) inner join
                room on econnection.room = room.room) inner join
                agreement on agreement.room = room.room
            ");
        
        
        //Count the clinets in an eaccount
        $eaccount_shared = $dbase->chk("
            SELECT 
                eaccount, 
                Count(eaccount.client) AS CountOfclient
            FROM 
                ($eaccount_client) as eaccount
            GROUP BY 
                eaccount.eaccount
            HAVING 
                Count(eaccount.client)>1
            ");
        //
        //
        $ebill_charge = $dbase->chk("
            SELECT 
                ebill.ebill, 
                ebill.current_amount/eaccount.countOfclient AS charge
            FROM 
                ebill inner join
                ($eaccount_shared) as eaccount on ebill.eaccount=eaccount.eaccount
            ");
        //
        //
        $this->emeter_report = $dbase->chk("
            SELECT DISTINCT 
                eaccount.num, 
                client.title, 
                eaccount_shared.CountOfclient, 
                ebill.current_amount,
                ebill.due_date, 
                ebill_charge.charge
            FROM (((((((((
                ebill inner join 
                eaccount on ebill.eaccount = eaccount.eaccount) inner join
                elink on elink.eaccount=eaccount.eaccount) inner join 
                emeter on emeter.emeter = elink.emeter)inner join 
                econnection on econnection.emeter = emeter.emeter) inner join 
                room on econnection.room = room.room) inner join 
                agreement on agreement.room = room.room) inner join 
                client on agreement.client = client.client) inner join 
                ($eaccount_shared)as eaccount_shared on eaccount_shared.eaccount = eaccount.eaccount)
                   inner join 
                ($ebill_charge)as ebill_charge on ebill_charge.ebill = ebill.ebill) inner join
                ($ebill_most_recent)  as ebill_most_recent  on ebill_most_recent.ebill = ebill.ebill
        ");
       
    }
    
    //Execute the driver sql and return the result as a json string
    function get_lovinah_json(){
        //
        //Get the driver sql
        $sql = $this->eaccount_report;
        //
        $result = $this->driver->dbase->query($sql);
        //
        $data = $result->fetchAll();
        //
        return json_encode($data);
    }
    
    function email_lovinah_report(){
       //
       //ini_set('smtp_port', '?');
       //
       //setting the mail option
       //provinding the destination of the mail
       $to = "santamulantei8@gmail.com";
       //
       //providing the subject of the mail
       $subject = "Electricty bills";
       //
       ob_start();
       $this->display_lovinah_report();
       //$content = ob_get_clean();
       $content="Testing";
       //
       $fromheader="From:mutallco@gmail.com";
       //
       if (mail($to, $subject, $content, $fromheader)){
            //
            return "ok";
       }
       return "failed";
    }
}

//Modell the ebill meessage table
class msg extends page_records {

    //
    //Construct the msg instance
    function __construct() {
        //
        //Compile a querystring
        $qstring = querystring::create(INPUT_POST);
        //
        //Add the database name to the querystring
        $qstring->arr['dbname'] = 'mutallco_rental';
        $qstring->arr['tname'] = 'msg';
        //
        //Construct the parent using a querystring
        parent::__construct($qstring);
    }
    
    //Save all the messsages, coming in as a json string, to the msg table and
    //export them to the e-ebill
    function save_all($jsonmsg){
        //
        //Save the json message to an external file for debugging
        //file_put_contents("json.txt", $jsonmsg);
        //
        //Convert it to php data
        $msgarray = json_decode($jsonmsg);
        //
        //Loop through all the individual messages and save them to the dabase
        foreach ($msgarray as $imessage) {
            //
            //Output the message value
            //$msgbody = $imessage->message;
            //
            //Save this one line of a message to the msg table
            $this->save_one($imessage);
        }
        /*
        //
        //Export the messages to an ebill
        $ebill = new ebill();
        //
        //Save all the messages
        $ebill->save_all($msgarray);
         */
    }
    
    //Save one mesage to the msg table
    function save_one($body) {
        //
        //Get today's date
        $date = date("Y-m-d");
        //
        //Get the dbase that is driving this page
        $dbase = $this->driver->dbase;
        //
        //Formulate an sql for inserting a message
        $sql = "
            insert into msg
            (body, date)
            values
            ('$body', '$date')
            on duplicate key update  date='$date'   
         ";
        //Execute the sql on the dbase;
        $dbase->query($sql);
    }

    //Export the selected (using a conditioned sql?) the 9555-returned 
    //messages to the ebill
    function export() {
        //
        //Get the database
        $dbase = $this->driver->dbase;
        //
        //Get the conditioned sql that is driving this page
        $sql = $this->get_sql();
        //
        $stmt = $dbase->query($sql);
        //
        while ($result = $stmt->fetch_assoc()) {
            //
            //Get the message
            $msg = $result['body'];
            //
            $msgprimary = $result[$this->tname];
            //
            //
            $current_amount = $this->myextract($msg, "AMOUNT: ", "Due on : ");
            //
            //Get the account name
            $account_num = $this->myextract($msg, "ACCOUNT: ", "NAME: ");
            //
            $eaccount = null;
            if ($this->try_primarykey($account_num, $eaccount)) {
                //
                $due_date = $this->myextract($msg, "Due on : ", "THANK ");
                //
                //Formulate the insert sql 
                $insert = "
                    insert into ebill
                    (eaccount, due_date, current_amount, msg)
                    values
                    ('$eaccount', '$due_date', '$current_amount', '$msgprimary')
                    on duplicate key update due_date='$due_date'
                ";
                $dbase->query($insert);
            } else {
                //decide how to treat a missing account
            }
        }
        echo 'ok';
    }

    
    //Extract teh demarcated data
    function myextract($msg, $w1, $w2) {
        //
        //Let p1 be the position of the first word
        $p1 = strpos($msg, $w1);
        //
        //Let p2 be the first position of the amound
        $p2 = $p1 + strlen($w1);

        //Calculate theh length of the ampunt
        //
        //Let p3 be the starto of the ampunt terminator
        $p3 = strpos($msg, $w2);
        //
        //The amount lenth is the difference between the start and the terminator
        $l = $p3 - $p2 - 1;

        //
        return substr($msg, $p2, $l);
    }

    //Returns teh primary key of the given eaccount number
    function try_primarykey($account_num, &$eaccount) {
        //
        //Formulate an sql
        $sql = "
            select 
                eaccount 
            from 
                eaccount
            where num='$account_num'";
        //
        //Get the database that is driving this page
        $mysql = $this->driver->dbase;
        //
        //Execute teh sql
        $stmt = $mysql->query($sql);
        //
        //Fetch teh result--
        $result = $stmt->fetch_assoc();
        //
        //Throw an error if no account found
        if (!$result) {
            return false;
        }
        //
        $eaccount = $result['eaccount'];
        //
        //return the account
        return true;
    }

}

//
class eaccount extends page_records {

    //
    function __construct($qstring) {
        //
        //Add the database name to the querystring
        $qstring->arr['dbname'] = 'mutallco_rental';
        $qstring->arr['tname'] = 'eaccount';
        //
        //Construct the parent using a querystring
        parent::__construct($qstring);
    }

    //Save the query used for constructing this page to the job table
    function save_2_job() {
        //
        //Get the conditioned sql statement that was used to pop[ulate this page
        $sql = $this->get_sql();
        //
        $values = [
            'name' => "temp",
            'stmt' => $sql,
            'dbname' => $this->dbname
        ];
        //
        $jvalues = json_encode($values);
        //
        $job = new job();
        //
        //Call the save values option
        $job->save_values($jvalues);
        //
        return "ok";
    }

    //Override the page records driver to get a better view of the eaccounts
    function get_driver() {
        //
        //
        $dbase = new dbase(page_login::username, page_login::password, $this->dbname);
        //
        $sql = $dbase->chk("
            select
                eaccount.eaccount,
                eaccount.num as eaccount_num,
                emeter.num as emeter_num,
                emeter.uid as emeter_uid,
                emeter.name as emeter_name
            from(
                eaccount inner join 
                elink on elink.eaccount=eaccount.eaccount) inner join
                emeter on elink.emeter=emeter.emeter
        ");
        //
        return new sql($dbase, $sql);
    }

}

//Modell the missing accounts; its an extension of the accounts with message
//selection conditiion that is used for identifying the accounts missing from
//the disolayed messages
class eaccount_missing extends eaccount {

    //
    //The criteria for selecting available messages; it will be used to formulate
    //a left join eaacount with msg to identify the eaccounts not returned
    //by teh criteria
    public $xor_criteria;

    //
    //Construct the missing account instance. Note teh standard practice of 
    //highlighting the required data for constructor; the null option allows us 
    //to fill it up from the current querystring via the bind option
    function __construct($xor_criteria = null) {
        //
        //Construct a querystring from teh global variablkes, both $_POST and 
        //$_GET
        $qstring = new querystring();
        //
        //Bind the xor criteria; this effectively checks the criteria. It can be
        //missing
        $qstring->try_bind_arg('$xor_criteria', $xor_criteria, $this);
        //
        //Construct the parent using a querystring
        parent::__construct($qstring);
    }

    //Returns the sql driver of mising accounts, i.e., accounts that are not
    //in teh xored criteria
    function get_driver() {
        //
        //Create a new database bases on this page's dbname
        $dbase = new dbase(page_login::username, page_login::password, $this->dbname);
        //
        //The where calues for the message selections is valid only if there is
        //a message selection criteria
        $where = empty($this->xor_criteria) ? "" : " WHERE $this->xor_criteria";
        //
        //Select all message that fit the criteria
        $available_eaccounts = $dbase->chk("    
            select
               ebill.eaccount
            from
                ebill inner join 
                msg on ebill.msg = msg.msg
            $where
        ");
        //
        //List all the accounts not available
        $unavailable_eaccounts = $dbase->chk("
            select
                eaccount.eaccount,
                eaccount.num,
                eaccount.name
            from
                eaccount left join
                ($available_eaccounts) as available_eaccounts 
                        on available_eaccounts.eaccount=eaccount.eaccount
            where
                available_eaccounts.eaccount is null
        ");
        //
        //Return the missing accounts sql
        //                
        return new sql($dbase, $unavailable_eaccounts);
    }

}

class job extends page_records {

    //
    function __construct() {
        //
        $qstring = new querystring();
        //
        $qstring->arr['tname'] = 'job';

        parent::__construct($qstring);
        //
        //Set the statement
        $this->stmt = $this->driver->dbase->prepare("
            INSERT 
                INTO `$this->tname`
                    (`name`, `sql`, `dbname`) 
                VALUES 
                    (?, ?, ?)
                ON DUPLICATE KEY UPDATE 
                    `name`=values(`name`),
                    `sql`=values(`sql`),
                    `dbname`=values(`dbname`)
        ");
        //
        //Bind teh paramaters
        $this->stmt->bind_param("sss", $this->name_, $this->stmt_, $this->dbname_);
    }

    //Save the given (json) values to the database and return a null. This 
    //a much more simplified version of save_current_record of BUIS; it is smart
    //enough to do an implied update
    function save_values($jvalues = null, $update = null) {
        //
        $values = json_decode($jvalues);
        //
        $this->name_ = $values->name;
        $this->stmt_ = $values->stmt;
        $this->dbname_ = $values->dbname;
        //
        //Execute the sql, throwing any exception if there an error 
        $this->stmt->execute();
        //
        return null;
    }

}

class wcharge extends page_records {

    function __construct() {
        $qstring = new querystring();
        //
        //Water wreading is based on the equivalent table
        $qstring->arr['tname'] = 'wmeter';

        parent:: __construct($qstring);
    }

    function get_driver() {
        $dbase = new dbase(page_login::password, page_login::username,$this->dbname);        
        //
        //Derive the satement for thge requierd diusplay
       //
        //Get the previous date for new wreadings, i.e., those not "consumed", for 
        //each client connection. It is the maximum date that is less or equal to
        //the cuttoff date and that is consumed. (Note that direct link between 
        //wreading and consumption raised a modelling problem, so we replaces it 
        //with the bolean field,is_consumed. For these tests, remove this condition
        //AND Not wreading.is_consumed
        $wmeter_last_date = $dbase->chk("           
            SELECT 
                wreading.wmeter, Max(wreading.date) AS last_date
            FROM 
                wreading
            WHERE 
                wreading.is_consumed
            GROUP BY 
                wreading.wmeter
        ");  
        //
        //the following sql is developed to extract the last value of every meter
        //based on the last date to get the last value
        $wmeter_last_value = $dbase->chk("
            SELECT 
                wmeter_prev_date.wmeter, 
                wmeter_prev_date.last_date, 
                wreading.value AS last_value
            FROM 
                ($wmeter_last_date) as wmeter_prev_date INNER JOIN 
                wreading ON wmeter_prev_date.last_date = wreading.date AND 
                wmeter_prev_date.wmeter = wreading.wmeter
                ");
        //
        //this sql is developed to extract the current date which is the 
        //max date of the current month to establish the current situation.
        $wmeter_curr_date = $dbase->chk("
            SELECT 
                wreading.wmeter, Max(wreading.date) AS curr_date
            FROM 
                wreading
            GROUP BY 
                wreading.wmeter
            ");
        //
        //the purpose of this sql is to extract the current value of each meter
        // base on the current date 
        $wmeter_curr_value = $dbase->chk("
            SELECT 
                wmeter_curr_date.wmeter, 
                wmeter_curr_date.curr_date, 
                wreading.value AS curr_value
            FROM 
                ($wmeter_curr_date) as wmeter_curr_date  INNER JOIN 
                wreading ON (wmeter_curr_date.curr_date = wreading.date) AND 
                wmeter_curr_date.wmeter = wreading.wmeter");
        //
        //this is the last sql that is used to calculate the consuption of every meter.
        //the consuption is culculated by minusing the current value and the last
        //
        $wmeter_consumption = $dbase->chk("
            SELECT 
                wmeter.wmeter, 
                wmeter.name, 
                wmeter.serial_num, 
                wmeter_last_value.last_date,
                wmeter_curr_value.curr_date,
                wmeter_last_value.last_value,
                wmeter_curr_value.curr_value, 
                format(curr_value-last_value,2) AS consumption
            FROM 
                wmeter LEFT JOIN ($wmeter_last_value) as wmeter_last_value ON 
                wmeter.wmeter = wmeter_last_value.wmeter LEFT JOIN 
                ($wmeter_curr_value)as wmeter_curr_value ON 
                wmeter.wmeter = wmeter_curr_value.wmeter"
                );
        
       $sql = new sql($dbase, $wmeter_consumption); 
       
       return $sql;
    }

}

//Modelling data based on the the payment table 
class payment extends page_table{
    //
    function __construct($qstring) {
        //
        //The payment class is based on the payment table
        $qstring->arr['tname']='payment';
        //
        //Initializing the parent pareg_records class
        parent::__construct($qstring);
        //
        //Get a record from the sql_edit property of this class
        $record = $this->sql_edit->get_record();
        //
        //Prepare to fill the record with values from the database if the a
        //specified payment is requested
        if (!empty($qstring->arr['payment'])){
            //
            //Formulate criteria for pulling out any data, e.g., payment=1
            $primarykey=$qstring->arr['payment'];
            $criteria="payment=$primarykey";
            //
            //Fill the record with the requested data
            $record->fill($criteria);
        }
        //
        //Retrieve the fields of a record
        $fields = $record->fields;
        //
        //Set the corresponding fields in this payment class
        $this->amount=$fields['amount'];
        $this->date=$fields['date'];
        
        $this->description=new column_selection('payment','description', "selected");
        $this->description->value=$fields['description']->value;
        
        $this->type=new column_selection('payment','type', "checked");
        $this->type->value=$fields['type']->value;
        
        $this->ref=$fields['ref'];

        
    }
}

class column_selection extends column {
    //
    function __construct($tname, $name, $type){
        //
        $this->type= $type;
        //
        parent::__construct($tname, $name);
    }
    
    function show_selection($value){
        //
        if ($this->value ==$value){
            echo "$this->type='true'";
        }
    }
    
    //Show the edit box if the values dont't match
    function show($value){
        //
        if ($this->value !==$value){
           echo "hidden='true'";
        }
    }
}

//This class is based on a column that supports multipule choice, e.g., radio, 
//selector, checkbox.
//It provides methods on each of this choices that let them behave diferent 
//to capture quality data.
//The metadadayta required for painting this field are provided ny yeh mfield
class column_choices extends column{
    //
    //doing the constructor for the class 
    //it take $tname = table name 
    function __construct(column $col, $mfield) {
        $fname = $col->name;
        $tname = $col->tname;
        $this->offload_properties($col);
        $this->metadata = $mfield;
        parent::__construct($tname, $fname);
    }
    
    //Dispolay the value of a selection
    function display_value(page $page, mode $mode, driver_record $parent){//column_choices
        //
        $fname = $this->name;
        //
        //Check the type of input
        if (!empty($this->metadata->type)){
            
            //
            $selector_type = $this->metadata->type;
            //
            $att = "checked";
            //
            //Show the radio buttons
            foreach($this->metadata->choices as $choice){
                //
                echo "<label>{$choice[1]}:
                       <input
                           name='$this->name'
                           type='radio'
                           {$page->check2($fname, $choice[0], $att)}
                           value='{$choice[0]}'
                           onchange= page_record.driver.fields[fname].change_field(this, radio);
                       />
               </label>";
            }               
           // 
        }
        else{
            //
            //Show a selector
            //
            //
            $att = "selected";
            //Open teh selector
            echo "<select name=$fname onchange= page_record.driver.fields[fname].change_field(this, radio); >";
            //
            //Output the choices
            foreach($this->metadata->choices as $choice){
                echo "<option {$page->check2($fname, $choice[0], $att)}  "
                         . "value=$choice[0]>"
                        . "{$choice[1]}"
                           . "</option>";
            }

            //Close the selector         
            echo "</select>";
        }
        
    }
}
//
//This class is based on adjustement be it balance or an adjustement
class adjustments extends page_records{
    //
    //
    function __construct(){
        $qstring = new querystring();
        //
        parent::__construct($qstring);
    }
    function get_balance(){
        //
        //
        $dbase= $this->driver->dbase;
        
        //
        return $dbase->query("
            select
                balance_initial.balance_initial,  
                format(balance_initial.debit, 'N0') as debit,
                format(balance_initial.credit, 'N0') as credit,
                balance_initial.date,
                client.title,
                client.name
            from 
                $this->tname as balance_initial inner join
                client on balance_initial.client=client.client
            order by 
                $this->tname desc
        ");
    }
    function get_adjustment(){
        //
        //
        $dbase= $this->driver->dbase;
        
        //
        return $dbase->query("
            select
                adjustment.adjustment,  
                format(adjustment.debit, 'N0') as debit,
                format(adjustment.credit, 'N0') as credit,               
                adjustment.date,
                adjustment.description,
                client.title,
                client.name
                
            from 
                $this->tname as adjustment inner join
                client on adjustment.client=client.client
            order by 
                $this->tname desc
        ");
    }
    function get_payment(){
        //
        //
        $dbase= $this->driver->dbase;
        
        //
        return $dbase->query("
            select
                payment.payment,  
                format(payment.amount, 'N0') as amount,
                payment.ref,
                payment.date,
                payment.description,
                client.title,
                client.name
                
            from 
                $this->tname as payment inner join
                client on payment.client=client.client
            order by 
                $this->tname desc
        ");
    }
}

