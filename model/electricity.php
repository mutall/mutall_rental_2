<?php
namespace invoice;

//Modell the ebill meessage table
class msg extends page {

    //
    function __construct() {
        //
        parent::__construct();
    }
    
    function test(){
        $msg =' 
        [
            {"message":"Dear PETER KARIUKI MURAYA, ACCOUNT NO:29304144. Curr bill dated 19-01-2019 is as follows:  Active Meter - Curr Read: 3472 Prev Read: 2474,Billed Units: 998KWh,   Fixed charge: 0, Cons.units amount:14142.24 Fuel Cost and Levies: 3373.74,Taxes: 2307.79, Adjustments: -2459.77. Monthly bill is KShs: 17364. Prev Bal is KShs .12. Total Outstanding is KShs: 17364.12. Due date 28-01-2019. Kindly pay before due date. Thank You"},
            {"message":"Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743155. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1005 Prev Read: 996,Billed Units: 9KWh,   Fixed charge: 0, Cons.units amount:112.18 Fuel Cost and Levies: 29.64,Taxes: 18.35, Adjustments: -22.17. Monthly bill is KShs: 138. Prev Bal is KShs 288.31. Total Outstanding is KShs: 426.31."}
        ]';
        $this->save_all($msg);
    }
    
    //Save all the messages, coming in as a json string, to the msg table and
    //export them to the e-ebill
    function save_all($msg=null){
        //
        //Debugging: Replace posted message with the one from file
        //$msg = file_get_contents("data/msg_kenyapower.json");
        //$msg = file_get_contents("data/msg_95551.json");
        //
        //Bind the json message property
        page::bind_arg($this, 'msg', $msg);
        //
        //Save the json message to an external file for debugging
        //file_put_contents("data/msg_kenyapower.json", $msg);
        //file_put_contents("data/msg_95551.json", $msg);
        //
        //Convert it to php data
        $decoded_msgs = json_decode($msg);
        //
        //Ensure decoding works
        if (json_last_error() !== JSON_ERROR_NONE) { 
            //
            //yep, it's not JSON. Log error or alert someone or do nothing
            throw new \Exception(json_last_error_msg());
        } 
        //
        //Create an ebill for exporting the messages to.
        $ebill = new ebill();
        //
        //Loop through all the individual messages and save them:-
        //a) to the msg table and 
        //b) to the ebill table
        foreach ($decoded_msgs as $decoded_msg) {
            //
            //Save this one line of a message to the msg table and extract its 
            //body's data to the ebill.
            $this->save_one($decoded_msg->body, $ebill);
        }
        //
        echo "ok";
    }
    
    //The dbase to use with this class
    function get_dbase(){
        return new dbase_local_mutall_rental();
    }
    
    //Save one mesage to the msg table, extract minimal ebill data and save it
    //to the ebill table
    function save_one($body, $ebill) {
        //
        //Save to the msg table
        //
        //Formulate the id using md5 hashing algorithm
        $id = md5($body);
        //
        //Get today's date
        $date = date("Y-m-d");
        //
        //Formulate an sql for inserting a message
        $this->dbase->query("
            insert 
                into msg (id, body, date)
            values 
                ('$id', '$body', '$date')
            on duplicate key update  
                date=values(date), body=values(body)   
         ");
        //
        //Save to the ebill table
        //
        //Define a message
        $msg = new \stdClass();
        //
        //Enrich this message component
        $msg->id = $id;
        $msg->date = $date;
        $msg->body = $body;
        //
        //Extract the data from the message and save it to the ebill table
        $ebill->save_msg($msg);
    }

}

//
//Inorder for ebill to access a database, it must extend a page
class ebill extends page{
    
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
        parent::__construct();
        //
        //Set the message formats from the json text files
        $this->formats = $this->get_formats();
    }
    
    //Reteuns the dbase of a//
    function get_dbase(){
        return new dbase_local_mutall_rental();
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
        $content = file_get_contents("../mutall_rental/model/ebill.json");
        //
        //Convert it to php std class data and return it
        return  json_decode($content);
    }
    
    //Save all the received ebill-messages to this ebill table. The msg has the 
    //(javascript) format:-
    //{format:"kplc", messages:[m1, m2, ...]}
    //assuming that all messages, mi's,  sent in a batch has the same format 
    function save_all($msgs){
        //
        //Loop throug all the actual messages and save them one by one guided by
        //the  patterns
        foreach($msgs as $msg){
           $this->save_msg($msg);
        }
    }
    
    //Extract data from and save the the given message to the ebill table
    function save_msg(\stdClass $msg){
        //
        //Get the elecricity patterns
        $patterns = $this->formats->electricity;
        //
        //Clear the patterns after each message
        $this->clear_patterns($patterns);
        //
        //            
        //Extract the data from the message body, guided by the patterns
        $msg->data = $this->get_data($msg->body, $patterns);
        //
        //Debug...
        //print_r($data);
        //
        //Check the data; if valid save it to the ebill; it is valid if it has
        //3 fields: account, date and value
        if (count($msg->data)!==3){
            //
            //Report the error
            //
            return false;
        }
        //    
        //Write the given data to te database. The data is a list of extracted values 
        //indexed by the field name.
        //
        //Get all the ebill data, attribute/value pairs, using teh electricity
        //matching pattern
        $attrs = $this->get_ebill_attr($msg->data, $patterns);
        //
        //Compile the ebill's eaccount foreign key field
        //
        //Let $eaccount be the primary key field value of the messages
        //eaccount   
        $eaccount_pk = null;
        //
        //Retrieve the eaccount' primary key
        //
        //Get the account number
        $num =$msg->data['accno']; 
        //
        //retrieve the eaccount primary key
        if (!$this->try_pk('eaccount', 'num', $num, $eaccount_pk)){
            //
            echo "The eacconut num, '$num', in message '$msg->body' is not found in the database<br/>";
            return false;
        }
        //
        //Compile the ebill's msg foreign key field
        //
        //Let $msg be the primary key field value of the saved message
        $msg_pk = null;
        //
        //Retrieve the message's primary key; the id is the idemtifier
        if (!$this->try_pk('msg',  'id', $msg->id, $msg_pk)){
            //
            throw new \Exception ("Message $msg->id not found in database ");
        }
        //
        //Compile all the ebill fields, i.e., attributes and foreign key
        //fields
        //
        //Get the ebill attribute field names
        $ebill_fields = array_keys($attrs);
        //
        //Add the neessary foreign keys
        $fields = array_merge($ebill_fields, ['eaccount', 'msg']);
        //
        //Convert the fields to a comma separated list
        $csv_fields = implode($fields, ",");
        //
        //Compile  all values, i.e., attrubutes and forengn key values
        //
        //Get all the ebill attrubute field values
        $ebill_values = array_values($attrs);
        //
        //Add the ebill's foreign key field values
        $values = array_merge($ebill_values, [$eaccount_pk, $msg_pk]);
        //
        //Add opening and closing quotes to all the values
        $qvalues = array_map(function($v){
            //
            return "'$v'";
        }, $values); 
        //
        //Convert the quoted values to csv's
        $csv_values = implode($qvalues, ",");
        //
        //
        //Insert the e-bill
        $this->dbase->query(
           "insert "
                . "into ebill ($csv_fields)"
                . "values ($csv_values)"
                . "on duplicate key update current_amount = values(current_amount) "     
        );
        //
        //Success
        return true;
    }
    
    //Prepare the patterns for extrating data from the next message by re-setting
    //the dlimiter scores
    function clear_patterns($patterns){
        //
        foreach($patterns as $pattern){
            foreach($pattern->delimiters as $delimiter){
                $delimiter->left->score=null;
                $delimiter->right->score=null;
            }
        }
    }
    
    //Retrieve the data from the given message and matching patterns. The pattern 
    //is a list of fields, where eacfield has the structure
    //PATTERNS = PATTERN*
    //PATTERN = {STRING fname, STORAGE, DELIMITERS}
    //
    //{name:"amt", storage:{entity:"e", attribute;"a"}, vtsv:["s1", "s2", ...]}
    //The returned data is an array of values indexed by teh field names
    function get_data($message, $patterns){
        //
        //Start with an empty list of values
        $values = [];
        //
        //Step through all pattern fields
        foreach($patterns as $pattern ) {
            //
            //Get the i'th value and set the starting point for next
            //itteration. Skip the field if not found????
            $value = null;
            //
            //Retuens a 'dirty' value
            if ($this->try_value($message, $pattern, $dvalue)){
                //
                //Clean the dirty value by removing any spaces (or funny 
                //characters) surrounding the value
                $value = trim($dvalue);
                //
                //Let fname be the field name to focus on
                $fname = $pattern->fname;
                //
                //Format the value, depending on its type
                //
                //Change date values from dd/mm/YYYY to YYY-mm-dd
                if ($fname=='date'){
                    //
                    //Str time tries to parse any text! to a date
                    $x = strtotime($value);
                    //
                    $value = date("Y-m-d", $x);
                }    
                //
                //Collect the value;
                $values[$fname] = $value;
            }
        }
        //
        //The return the requested data
        return $values;
    }
    
    //Returns from teh given message, the value that matches the pattern
    //PATTERN = {STRING fname, STORAGE, DELIMITERS}
    function try_value($message, $pattern, &$value){
        //
        //Step through the delimiters
        foreach($pattern->delimiters as $delimiter){
            //
            if ($this->match_delimiter($message, $delimiter, $value)){
                //
                //A match is found.
                return true;
            }
        }
        //Log the fact that the pattern did not yield any data from the message.
        //
        //Compile the delimue report
        $p = "<pre>". json_encode($pattern, JSON_PRETTY_PRINT)."<pre/>";
        //
        //
        echo 
        "Error. Unable to match pattern:- $p <br/>"
        . "In message:<br/>$message <br/><br/>";
        
        //Match not found
        return false;
    }
    
    //DELIMITER = {COMPONNET left, COMPONENT right}
    //COMPONENT = {STRING text, BOOLEAN score}
    function match_delimiter($message, $delimiter, &$value){
        //
        //Match the left component and set the position, starting from 
        //offset 0
        $p1=null;
        if ($this->match_component($message, $delimiter->left, 0, $p1)){
            //
            //
            //Get the start of the value to output; its also the next offset
            $offset = $p1 + strlen($delimiter->left->text);
            //
            //Match teh right component, statng from offset $p1
            $p2 = null;
            if ($this->match_component($message, $delimiter->right, $offset, $p2)){
                //
                //Extract the field's value from teh messagee
                //
                //The end of the value is $p2, so the lenth of the message 
                //is (why -1??) 
                $length = $p2 - $offset; 
                //
                //Retreve the value
                $value = substr($message, $offset, $length);
                //
                return true;
            }
        }
        //
        //Matching failed
        return false;
    }    
    
    //Match the delimiter text
    function match_component($message, &$component, $offset, &$p){
        //
        $p = strpos($message, $component->text, $offset);
        //
        if ($p!==false){
            //
            //Do the scooring
            $component->score=true;
            //
            //Match found. Return true
            return true;
        }
        else{
            //
            //Do teh scorring
            $component->score = false;
            //
            //Match not found, continue the search
            return false;
        }
    }
    
    //Get all the ebill data, as attribute/value pairs.
    //The pattern has the syntax: 
    //  [{fname:x, storage:y, vtsv:z}, ...]
    //and the data is an array of values indexd by field name
    //  [fname=>value,...]
    //The required ebill data has the syntax:-
    //  [attribute=>value, ...]
    function get_ebill_attr($data, $patterns){
        //
        //Start with no ebill attributes
        $attrs = [];
        
        //
        //Step through data's fname/value  pairs
        foreach($data as $fname=>$value){
            //
            //Search for $fname in the given patterns
            //
            //Look for the field in the pattern that matches the field name, 
            //assuming that the patern is indexd by field name
            $found = false;
            foreach($patterns as $pattern){
                if ($pattern->fname == $fname){
                    $found = true;
                    break;
                }
            }
            //
            //Its an error if the named field cannot be found
            if (!$found){
                throw new \Exception("Field $fname not founf in pattern");
            }
            //
            //Consider only those cases where the storage is valid, where valid 
            //means....
            $valid = isset($pattern->storage) && !is_null($pattern->storage);
            //
            //Check if the entities name is ebill
            if ($valid && $pattern->storage->entity=='ebill'){
                //
                //Retrieve the attribute's name
                $attrname = $pattern->storage->attribute;
                //
                //Collect the attribute
                $attrs[$attrname] = $value;
            }
        }
        //
        //Return the collected attributes
        return $attrs;
    }
    
    //Returns the primary key of the requested entity given its attribute name and value
    function try_pk($entity, $attrname, $attrvalue, &$pk){
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
        }
        //
        //No key was found
        return false;
        
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
            throw new \Exception("Account num $account_num not found");
        }
        //
        //return the account
        return $result['eaccount'];
    }
}

//This class models teh eccaount sub-system of the mutall_rental system
class eaccount extends page{
    
    //Returns the dtabase to use with this page
    function get_dbase(){
        return new dbase_local_mutall_rental();
    }
    
    //Returns, to the server, all the eaccount numbers a json string
    function get_all_eaccounts(){
        //
        //Select all the eaccount numbers
        $results = $this->dbase->query(
            "select "
                . "name, num "
            . "from "
                . "eaccount"    
        );
        //
        $y = $results->fetchAll();
        
        $jsonstr = json_encode($y);
        //
        //Return to the server, the json string of all the account nos.
        echo $jsonstr;
        
    }
    
}