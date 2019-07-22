<?php
//Add classes that are shared across projects, e.e., page

//This class is extended by all mutall objects, i.e., its the root of all 
//mutall -compatible classes. The key property is classname which is used
//for activation purposes???
class mutall {
    //
    //All mutall objects support the classname property
    public $classname;
    //
    //The default database associated with this MUTALL object is set from 
    //php global variables
    public $dbase;
    //
    //The index last page saved to the global session variable
    const last_page = "last_page";
    //
    //saved
    //The constant for accessing the mutall data in the global variables
    const id = "mutall";
    //
    //The following variables, layout_typ, mode_type and criteria are defined for
    //all mutall objects so that querystring and page objects, which need them,
    //can access them.
    //
    //The file name (without extension) of the page being served. This name is
    //used for naming variables that are shared between js and php
    public $page_filename;
    //
    //Whicn version of buis are we running on? This is needed to inform 
    //the javascript ajax and open_window methods the folder to search to
    //the files -- as they may not be located in the root of the server
    public $version;

    //Construct the mutall object
    function __construct() {
        //
        //All mutall objects have a classame that allows a jvascript or php
        //application to activate it using a mutalll object for bootstrapping
        //purposes
        $this->classname = get_class($this);
        //
        //Set the name of the page that is being served. (It is not __FILE__ !)
        $path = $_SERVER['SCRIPT_FILENAME'];
        $this->page_filename = pathinfo($path, PATHINFO_FILENAME);
        //
        //The version of buis is the base name of the folder on which
        //this file resides.
        $this->version = "../" . pathinfo(__DIR__, PATHINFO_BASENAME);
        //
        //Set an error handler that converts all php notices, warnings, errors, etc
        //into exceptions.
        set_error_handler(function($errno, $message, $filename, $lineno, array $errcontext) {
            //
            //If the error was suppressed with the @-operator...
            if (0 === error_reporting()) {
                //
                //..then return false
                return false;
            }
            //
            //Convert the php notice, warning or error into an exception
            throw new ErrorException($message, 0, $errno, $filename, $lineno);
        });
    }

    //Returns the a name of the refering website. This is important 
    //for the jax method to find new locally defined classes. 
    function get_website_file() {
        //
        //Get the http that referered to this page, e.g.
        //http://localhost/eureka_waters/poster.php?dbname=mutallco_eureka_waters&year=2017&month=1&XDEBUG_SESSION_START=XDEBUG_ECLIPSE
        $referer = $_SERVER['HTTP_REFERER'];
        //
        //Extract the url path, e.g., eureka_waters/poster.php or
        //development/buis/page_buis.php
        $path = parse_url($referer, PHP_URL_PATH);
        //
        //Retrieve the directory, e.g., /development/buis
        $dir = pathinfo($path, PATHINFO_DIRNAME);
        //
        //Retrieve the basename, e.g., buis
        $basename = pathinfo($dir, PATHINFO_BASENAME);
        //
        //Compile the complete website-specific php file
        //e.g., /development/buis/buis.php
        return "../$basename/$basename.php";
    }

    //The string version of a mutall object returns a checked json string. It is
    //useful for interfacing js with php
    function __toString() {
        //
        //Convert this mutall object into a checked json string
        return $this->stringify();
    }

    //Return the ok message to the client via the ajax mechanism
    function ok() {
        //
        //To avoid noise, do a fresh object -- rather than pass this one
        $obj = new stdClass();
        //
        //Set the ststus to ok
        $obj->status = "ok";
        //
        //There is no html data and no extra
        $obj->html = "";
        $obj->extra = "";
        //
        $output = json_encode($obj);
        //
        //Echo the json version of the output
        //echo $output;
        echo $output;
    }

    //
    //Search the global variables for the posted *static) mutall data in this order:
    //$_POST, $_GET and $_SESSION. Return false if none. The cache is used for
    //efficiency
    function get_posted_data() {
        //
        //Start by checking the casch
        if (isset($this->global_data)) {
            return $this->global_data;
        }
        //Ensure that the returned values from here are all json_decoded, i.e,
        //converted to php stdClasses;
        //
        //The data comes from a get querystring 
        if (isset($_GET[mutall::id])) {
            //
            $str = $_GET[mutall::id];
        }
        //The data comes from a posting
        elseif (isset($_POST[mutall::id])) {
            $str = $_POST[mutall::id];
        }
        //
        //The data comes from a session variable
        elseif (isset($_SESSION[mutall::id])) {
            $str = $_SESSION[mutall::id];
        }
        //
        //...otherwise there is no data; return false
        else {
            return false;
        }
        //
        //Convert the str to a proper php by doing a checked json_encode
        $php = json_decode($str);
        //
        //If the php is null there must have been a decoding error. Report it
        if (is_null($php)) {
            die("Json decoding error: "
                    . json_last_error_msg()
                    . "<br/> Occcued in page " . $this->page_filename);
        }
        //
        //Cache the global data and return it
        $this->global_data = $php;
        //
        return $php;
    }

    //Returns true if a property is found in any of the the given variable
    //under key mutall::id
    function try_property($source, $name) {

        //
        //Check if the data ia available
        if (!isset($source[mutall::id])) {
            return false;
        }
        //Check if the property  exists
        $data = json_decode($source[mutall::id]);
        //
        if (!isset($data->$name)) {
            return false;
        }
        //
        //return the data
        return $data->$name;
    }

    //Retrieve the requested data from any of the global variables searching 
    //in this order: $_GET, $_POST and $_SESSION. It throws an exception if the
    //requested data cannot be found
    function get_property($name) {
        //
        //List all the global variables to search, starting from this object
        $sources = [$_GET, $_POST, $_SESSION];
        //
        //Visit each of the global variables
        foreach ($sources as $source) {
            //
            $value = $this->try_property($source, $name);
            //
            //Return the value if it is valid. (An empty string is false!!)
            if ($value || $value === "") {
                //
                return $value;
            }
        }
        //
        //Request not met
        throw new Exception("No data found for property '$name'");
        //
    }

    //Execute the a function (module) of this mutall object. It nust be set
    function execute() {
        //
        //Get the global data
        $data = $this->get_posted_data();
        //
        //If the module is not set, set it to "show"
        $module = (isset($data->module)) ? $data->module : "show";
        //
        //Catch ane remport eny execution errors
        try {
            //
            //Execute it. How would you test if the function is implemented?
            echo $this->$module();
        } catch (Exception $ex) {
            //
            echo $ex->getMessage() . ". " . $ex->getTraceAsString();
        }
    }

    //Report the given error -- including the page where it ocurred; then die
    function error($msg) {
        //
        die($msg . "<br/> Error occured in page " . $this->page_filename);
    }

    //Returns the best database connection. It may be /immediately available; 
    //if not then create a new one using the available login credentials. This 
    //the old version implementation.
    function get_dbase() {
        //
        //If the dbase property is set, return it; otherwise continue to 
        //establish it from user log in credentials
        if (isset($this->dbase)) {
            //
            //Test if we need to activate it or not
            if (get_class($this->dbase) === "stdClass") {
                //
                //Yes we do. Activate it/
                $this->dbase = $this->activate($this->dbase);
            }
            //
            //Return the active form
            return $this->dbase;
        }
        //
        //The database name must be a valid property of this object; otherwise 
        //you get a runtime error.
        $dbname = $this->dbname;
        //
        //Create a new database connction; Buis has unfetterd access to
        //all teh databases -- but you must have registed to access buis    
        $this->dbase = new dbase(page_login::username, page_login::password, $dbname);
        //
        //Return the connected database
        return $this->dbase;
    }

    //Open a mutall_data database using the login credentials of an administrator
    //(rather than those of the user because this opertaion is a BUIS process)
    function get_mutall_dbase() {
        //
        return new dbase(page_login::username, page_login::password, page_login::mutall_data);
    }

    //This method to converts the given static data (note the underbar) with the 
    //classname property to an mutall object of that named class -- thus 
    //activating it.
    function activate($input_) {
        //
        //Classify the input to either mutall, object, array or other
        $type = $this->classify($input_);
        //
        switch ($type) {
            //
            //mutall objects have a classname
            case "mutall":
                //
                //Avoid endless looping for a class called mutall
                if ($input_->classname === "mutall") {
                    $input = $this;
                }
                //
                //For all other classes, activate them
                else {
                    $input = $this->activate_class($input_->classname, $input_);
                    //
                    //Append to the active object the rest of the properties
                    foreach ($input_ as $property => $static_value) {
                        //
                        //Activate the static value and set the corresponding 
                        //property if not yet set by the constructor (or it is null)
                        if (!isset($input->$property) || is_null($input->$property)) {
                            //
                            $input->$property = $this->activate($static_value);
                        }
                    }
                }
                break;
            //
            //For an ordinary object offload all the properties defined by the 
            //input unconditionally    
            case "object":
                //
                $input = new stdClass;
                //
                foreach ($input_ as $property => $static_value) {
                    //
                    //Activate the static value and set teh corresponding property
                    //on the active object
                    $input->$property = $this->activate($static_value);
                }
                break;
            //
            //For the array activate all the components
            case "array":
                //
                $input = [];
                //
                //Visit all the elements of the array
                foreach ($input_ as $property => $static_value) {
                    //
                    //Activate teh static value
                    $value = $this->activate($static_value);
                    //
                    //Set the property
                    $input[$property] = $value;
                }
                break;
            //
            //Any other structure is returned as it is
            default:
                $input = $input_;
        }
        //
        //Return the active object
        return $input;
    }

    //Classify the given object as either mutall, object, array or other    
    function classify($input_) {
        //Find out if this is an array or o=not
        if (is_array($input_)) {
            return "array";
        }
        //
        //Determin if this is an ordinary object or a mutall class
        if (is_object($input_)) {
            //
            if (isset($input_->classname)) {
                return "mutall";
            }
            //
            return "object";
        }
        //
        //Return any other type
        return "other";
    }

    //Report exceptions in a more friendly fashion
    function report_error($ex) {
        //
        //Replace the hash with a line break in teh terace message
        $trace = str_replace("#", "<br/>", $ex->getTraceAsString());
        //
        //Retirn the full message
        return $ex->getMessage() . "<br/>$trace";
    }

    //Save the current page to the global session variable. This is achived by 
    //saving the given query string (text) to th last page sesion variable
    function save_to_session($qstring = null) {
        //
        //Bind teh querystring variable to the actual query string in teh posted
        //data
        $this->bind_arg('querystring', $qstring);
        //
        //Save it to the lastpage session variable, overrrining whatever was 
        //there
        $_SESSION[mutall::lastpage] = $qstring;
    }

    //Returns the true if the login credentials can be found in session variables. 
    //The credentails are bound to teh reference variable.
    //It fails with an exception if the user is not logged
    function get_login(&$login) {
        //
        if (!$this->try_login($login)) {
            throw new Exception("Login credentials not found.");
        }
    }

    //Returns true if the login credentials are available; they are bound to the
    //given variable
    function try_login(&$login) {
        //
        //See if login credentals are available
        if (isset($_SESSION['login'])) {
            //
            $login = $_SESSION['login'];
            return true;
        }
        return false;
    }

    //Returns a more friendly fassion of the exception error. This is important
    //when the remote server's error reporting has been switched off.
    function get_error($ex) {
        //
        //Replace the hash with a line break in teh terace message
        $trace = str_replace("#", "<br/>", $ex->getTraceAsString());
        //
        //Retirn the full message
        return $ex->getMessage() . "<br/>$trace";
    }

    //An checked json encoding function.
    //Compile the given context to a json string and check the
    //conversion results for recursion. The conversion exits on error.
    //You beed to inspect the appropriate script tag to see where
    //unprotected resursion occured
    function stringify() {
        //
        //Call the (default) unchecked json encoder. You can use JSON_PRETTY_PRINT
        //to fore the json structire to be pannded with spacing to make it 
        //easy to read.
        $json = json_encode($this);
        //
        //Test whether the encoding was sucsessful or not; dying if not. 
        //Recursion is one cause of encoding errors
        if (!$json) {
            //Show the json message
            echo(json_last_error_msg());
            //
            //Echo the jsoned structure to show error points. What is the true
            //parameter for? It is for forcing print_r to retirn the string, 
            //rather than print the structure
            die(print_r($this, true));
        }
        //
        //Return the encoded strimg
        return $json;
    }

    //Offload properties from the given static input to this mutall object with
    //an option for activating them or not. Under what circumstaces is activation
    //necessary? All the indications are that we it should not be done, 
    //particulary for pages that re-calls themselves. In the case of a simple 
    //page_record refresh it caused a re-build of page_record (which is not
    //a trivial page) and slowed down process. Hence the action was switched off
    function offload_properties($input, $activate = null) {
        //
        //Proceed only if the input is an object. (What about an array?)
        if (!is_object($input)) {
            return;
        }
        //
        //The input is an object. Offfload its key/value pairs
        foreach ($input as $key => $value) {
            //
            //Ignore this property if it is not already set (by the 
            //constructor) or if the set value is null
            if (!isset($this->$key) || is_null($this->$key)) {
                //
                //Set the property -- activating it if necessaty
                $this->$key = is_null($activate) ? $value : $this->activate($value);
            }
        }
    }

    //Go to the named php page; its the equivalent of open_window in js
    function open_window($name = null) {
        //
        //Use the given name as the filename if it is valid; otherwise use the 
        //classname of this mutall object as the page name with a php file extension
        $filename = is_null($name) ? "$this->classname.php" : $name;
        //
        //The file must exist
        if (!file_exists($filename)) {
            //
            throw new Excecemption("File named $filename does not exist");
        }
        //
        //Use the fileame to redirect to another page
        header("Location:" . $filename);
    }

    //Activate the registered class
    function activate_class($classname, $obj) {//mutall
        //
        //Create the registered class object -- depending on the class name. 
        //Classes that are constructed with more have more need to be 
        //regietered explicitly. Those without uses the default initializer
        switch ($classname) {
            //
            //An ordinary column needs no specilaization
            case "column":
                $tname = $obj->tname;
                $name = $obj->name;
                $class = new column($tname, $name, $obj);
                break;
            //
            case "column_primary":
                $tname = $obj->tname;
                $name = $obj->name;
                $class = new column_primary($tname, $name, $obj);
                break;
            //    
            case "column_foreign":
                $tname = $obj->tname;
                $name = $obj->name;
                $foreign = $obj->foreign;
                $class = new column_foreign($tname, $name, $obj, $foreign);
                break;
            //
            case "dbase":
                $username = $obj->username;
                $password = $obj->password;
                $dbname = $obj->dbname;
                $class = new dbase($username, $password, $dbname);
                break;
            //
            //A text expression must have a text property that is used for 
            //instantiating a text expressin
            case "expression_text":
                //
                //Get the  text property
                $text = $obj->text;
                //
                //Instantiate the text expression
                $class = new expression_text($text);
                break;
            //
            case "record":
                $fields = $this->activate($obj->fields);
                $dbase = $this->activate($obj->dbase);
                //
                //Leave out the optional tname; it will be added to the active 
                //record anyway.
                $class = new driver_record($fields, $dbase, $obj->tname, $obj->reftable, $obj->sql, $obj->values);
                break;
            //      
            //Otherwise use the general initializer
            default:
                //Test if the class exists in this file
                if (class_exists($obj->classname)) {
                    //
                    //This is not guranteeed to always work; it wil fail if the
                    //constructor has madtory parameters. So, trap it.
                    $class = new $obj->classname();
                }
                //
                //Otherwise throw an exception
                else {
                    throw new Exception("This class '$obj->classname' is not registered in the mutall system");
                }
        }
        //
        //Return theh class
        return $class;
    }
}

//The dbase class models a postgres or mysql databas
class dbase extends mutall {

    //
    //Public variables of a database
    public $username;
    public $password;
    public $dbname;
    //
    //The database connection is protected so that it is not jsonable.
    protected $conn;
    //
    //The base tables of this database; what about the views?
    protected $tables = [];

    // 
    function __construct($username, $password, $dbname) {
        //
        $this->username = $username;
        $this->password = $password;
        $this->dbname = $dbname;
        //
        //Initilaize the mutall object
        parent::__construct();
        //
        //Establish the database connection
        $this->conn = $this->set_connection();
    }

    //Define the magic getter and setter functions for this dbase's protected 
    //properties, viz, connectrion and tables;  these are never jsoned
    function __get($prop) {
        return $this->$prop;
    }

    function __set($prop, $value) {
        $this->$prop = $value;
    }

    //Check the sql for validity in the context of this database; it returns 
    //the same sql
    function chk($sql) {
        //
        //Get the database connection
        $mutall_conn = $this->conn;
        //
        //Check the sql
        $stmt = $mutall_conn->prepare($sql);
        //
        //Check for errors
        if (!$stmt) {
            throw new Exception($mutall_conn->error . "<br/>$sql");
        }
        //
        //Close the statement after check so that teh database connection can
        //be re-used
        $stmt->close();
        //
        //Return the same sql as the input
        return $sql;
    }

    //Implement the database execute with check
    function query($sql) {
        //
        $result = $this->conn->query($sql);
        //        
        //Check the result
        if (!$result) {
            throw new Exception($this->conn->error);
        }
        //
        return $result;
    }

    //Implement the sql preparation with check on validity
    function prepare($sql) {
        //
        $stmt = $this->conn->prepare($sql);

        //Execute the delete 
        if (!$stmt) {
            throw new Exception($this->conn->error);
        }
        //
        //The statement to return is our new version
        return new statement($this, $stmt, $sql);
    }

    //Establish the database connection
    function set_connection() {
        //
        //Open the database using the given credentials on the local server
        $conn = new mysqli("localhost", page_login::username, page_login::password, $this->dbname);
        //
        //Check for connection error
        if ($conn->connect_error) {
            throw new Exception($conn->connect_error);
        }
        //
        return $conn;
    }

    //When you unesrialize this database, re-establish the connction.
    function __wakeup() {
        $this->conn = $this->set_connection();
    }

    //Returns the requested table, first by looking up from protected tables, 
    //then from first principles
    function get_table($tname) {
        //
        //Return the table if it is set for this database
        if (isset($this->tables[$tname])) {
            return $this->tables[$tname];
        }
        //
        //Otherwise create a new standard table from first principles
        else {
            $table = new sql_table($this, $tname);
            //
            //Update this database's table list
            $this->tables[$tname] = $table;
            //
            return $table;
        }
    }

    //Close the databse connection
    function close() {
        $this->conn->close();
    }

}

//A special database that Buis needs to support its operation
class dbase_mutall_data extends dbase {

    //
    //Statement for inserting synchronized data
    public $insert;
    //
    //Define the variables to be bound to the sql parameters
    //
    //Define the binary serialized version of a table's sql_edit with all
    //the table's fields in it. Compare this to the selector version below.
    public $sql_edit;
    //
    //A selector query is a serialilized version of the sql_edit query with 
    //primary key field only.
    public $sql_selector;
    //
    //Define a variable for holding error messages if serializing was 
    //not successful
    public $error;
    //
    //The entity (autonumber) being serialised
    public $entity;

    function __construct() {
        parent::__construct(page_login::username, page_login::password, "mutallco_data");
    }

    //Synchronize the mutall_data and information schema databases
    function synchronize_databases() {
        //
        //Set the system databses for filtering later
        $system_dbs = "
            'information_schema',
            'performance_schema',
            'phpmyadmin',
            'webauth',
            'mysql'
        ";

        //Select all databases registered in the:-...
        //
        //...(a) information schema, excluding php system databases
        $info = $this->chk("
            select 
                schema_name as dbname 
            from 
                information_schema.schemata
            where 
                schema_name not in ($system_dbs)
        ");
        //
        //..(b) mutall_data
        $mutall = $this->chk("
            select 
                name as dbname 
            from 
                mutallco_data.dbase
            ");
        //
        //Workout the databases to discard using a left join
        $discard = $this->chk("
            select 
                mutall.dbname 
            from
                ($mutall) as mutall left join
                ($info) as info on mutall.dbname=info.dbname
            where isnull(info.dbname)
        ");
        //
        //Select the databases to discard
        $delete = $this->chk("
            delete 
                dbase.* 
            from 
                dbase inner join 
                ($discard) as discard on dbase.name=discard.dbname
        ");
        //
        //Execute the delete 
        $this->query($delete);
        //
        //Work out the new databases to insert
        $insertion = $this->chk("
            select 
                info.dbname 
            from
                ($info) as info left join 
                ($mutall) as mutall on mutall.dbname=info.dbname
            where 
                isnull(mutall.dbname)
        ");
        //
        //Select the databases to add
        $insert = $this->chk("
                insert into dbase 
                    (`name`) 
                    select 
                        dbname 
                    from 
                        ($insertion) as insertion");
        //
        //Execute the insertion
        $this->query($insert);
        
    }

    //Synchronize the mutall_data and information entities, a.k.a., tables
    function synchronize_entities() {
        //
        //Select all the tables from mutall data 
        $mutall = $this->chk("
            select 
                entity, 
                entity.name as tname, 
                entity.dbase,
                dbase.name as dbname 
            from 
                entity inner join 
                dbase on entity.dbase = dbase.dbase
        ");
        //
        //Get data entity names from information schema
        $info = $this->chk("select "
                //    
                //Substitute the table name with tname
                . " table_name as tname, "
                //
                //The dbname corresponds to the table schema    
                . " table_schema as dbname, "
                //
                //Add the looked up dbase
                . " dbase.dbase"
                //
                //The data comes from the information schems    
                . " from information_schema.tables"

                //Bring the dbased code    
                . " inner join dbase on dbase.name=table_schema"
                //
                //Only system tables are considered -- not views
                . " where table_type='base table'");

        //Workout the entities to discard
        $discard = $this->chk("
            select 
                mutall.entity 
            from
                ($mutall) as mutall 
                left join ($info) as info 
                    on mutall.tname=info.tname and mutall.dbname=info.dbname
            where 
                isnull(info.dbname)
        ");
        //
        //Select the entities to discard
        $delete = $this->chk("
            delete 
                entity.* 
            from 
                entity 
                inner join ($discard) as discard 
                    on discard.entity=entity.entity
        ");
        //
        //Execute the delete and throw exception if query not valid 
        $this->query($delete);
        //
        //Work out the entities to insert
        $insertion = $this->chk("
            select 
                info.tname, 
                info.dbase 
            from
                ($info) as info 
                left join ($mutall) as mutall 
                    on mutall.tname=info.tname and mutall.dbname=info.dbname
            where 
                isnull(mutall.tname)
        ");
        //
        //Select the entities to add
        $insert = $this->chk("
            insert into entity 
                (`name`, `dbase`) 
                select 
                    tname, 
                    dbase 
                from ($insertion) as insertion
        ");
        //
        //Execute the insertion
        $this->query($insert);
    }

    //Synchronize the databases in mutall data with those in the information 
    //schema and serialize the tables. 
    function synchronize() {
        //
        //Synchronize databases
        $this->synchronize_databases();
        //
        //Synchronize entities
        $this->synchronize_entities();
        //
        //Synchronize attributes
        $this->synchronize_attributes();
        //
        //Serialize (all the tables in all) the databases on the server
        $this->serialize_databases();
    }

    //Clear the synchronization tables
    function clear_synchronization_tables() {
        //
        $this->query("delete from serialization");
        $this->query("delete from attribute");
        $this->query("delete from entity");
        $this->query("delete from dbase");
    }

    //Synchronize the mutall_data and information schema sttributes
    function synchronize_attributes() {
        // 
        //Select all attributes registered in the...
        //
        //...information schema, filtered by the mutall_data databases and entities
        $info = $this->chk("
            select 
                dbase.dbase,
                entity.entity,
                columns.*
            from
                information_schema.columns as columns 
                inner join dbase on dbase.name = columns.table_schema
                inner join entity on 
                    entity.name = columns.table_name 
                    and entity.dbase=dbase.dbase
        ");
        //
        //..mutall_data
        $mutall = $this->chk(" 
            select
                attribute.attribute,
                attribute.name as attribute_name,
                attribute.entity,
                dbase.dbase
            from 
                attribute 
                inner join entity on 
                    entity.entity=attribute.entity 
                inner join dbase on 
                    dbase.dbase=entity.dbase
            ");
        //
        //Workout the attributes to discard
        $discard = $this->chk("
            select 
                mutall.attribute 
            from
                ($mutall) as mutall 
                left join ($info) as info on 
                    mutall.attribute_name=info.column_name 
                    and mutall.entity=info.entity
            where 
                isnull(info.entity)
            ");
        //
        //Select the attributes to delete
        $delete = $this->chk("
            delete 
                attribute.* 
            from 
                attribute 
                inner join ($discard) as discard on 
                    discard.attribute=attribute.attribute");
        //
        //Execute the delete 
        $this->query($delete);
        //
        //Work out the attributes to insert
        $insertion = $this->chk("
            select 
                info.* 
            from
                ($info) as info left join 
                ($mutall) as mutall on mutall.attribute_name=info.column_name and mutall.entity=info.entity
            where isnull(mutall.entity)"
        );
        //
        //Select the attrbutes to add
        $insert = $this->chk("
            insert into attribute 
                (
                    `name`, 
                    `entity`, 
                    `position`,
                    `default`,
                    `is_nullable`,
                    `data_type`,
                    `character_maximum_length`,
                    `numeric_precision`,
                    `numeric_scale`,
                    `type`,
                    `comment`
                ) 
            select 
                column_name, 
                entity, 
                ordinal_position,
                column_default,
                is_nullable,
                data_type,
                character_maximum_length,
                numeric_precision,
                numeric_scale,
                column_type,
                column_comment
            from 
                ($insertion) as insertion"
        );
        //
        //Execute the insertion
        $this->query($insert);
    }

    //Serialize (all the tables for all the) databases on the server
    function serialize_databases() {
        //
        //Compile the sql (for inserting a serialization) in terms of its 
        //parameters)
        $this->insert = $this->prepare("
            insert into 
                serialization
                (entity, sql_edit, sql_selector, error) 
            values
                (?, ?, ?, ?)
         on duplicate key update 
                sql_edit=?, 
                sql_selector=?, 
                error=?
        ");
        //
        //Sql bind the variables to their matching parameters
        $this->insert->bind_param("sssssss", $this->entity, $this->sql_edit, $this->sql_selector, $this->error, $this->sql_edit, $this->sql_selector, $this->error
        );

        //
        //Step through all the databases of mutall_data database
        $result = $this->query("
            select 
                name as dbname
            from
                dbase
        ");
        //
        while ($row = $result->fetch_assoc()) {
            //
            //Open the named database
            $db = new dbase(page_login::username, page_login::password, $row['dbname']);
            //
            //Serialize the entities in the given database
            $this->serialize_entities($db);
            //
            //Close the dbname
            $db->close();
        }
    }

    //Serialize the tables in the given database guided by the entities in
    //this mutall data database 
    function serialize_entities(dbase $db) {
        //
        //Select all the entities of the given database
        $all = $this->chk("
            select
                entity.entity,
                entity.name
            from
                entity 
                inner join dbase on dbase.dbase=entity.dbase
            where
                dbase.name='$db->dbname'
        ");
        //
        //Select all the serialized entities of the same given database
        $serialized = $this->chk("
            select 
                entity.entity 
            from 
                serialization 
                inner join entity on 
                    serialization.entity=entity.entity 
                inner join dbase on 
                    dbase.dbase=entity.dbase
            where
                dbase.name='$db->dbname'
        ");
        //
        //Query all those entities of the given database that are not serialized
        $result = $this->query("
            select 
                all_entities.entity,
                all_entities.name
            from
                ($all) as all_entities 
                left join ($serialized) as serialized on 
                    serialized.entity=all_entities.entity
            where
                serialized.entity is null
        ");
        //
        //Step through all the tables
        while ($row = $result->fetch_assoc()) {
            //
            //Set the public entity
            $this->entity = $row['entity'];
            //
            //Serialize entity
            $this->serialize_entity($db, $row['name']);
        }
    }

    //Serialize the requested entity
    function serialize_entity(dbase $db, $tname) {
        //
        //Only mutall compliant tables are considered
        try {
            //
            //Select all the fields of a table and set the serialized version 
            //of the fully fielded sql_edit
            $this->sql_edit = serialize(new sql_edit($db, $tname, true));
            //
            //Set the serialized version of the partially fielded sql_edit
            //filt for record selection
            $this->sql_selector = serialize(new sql_edit($db, $tname, false));
            //
            //This is a valid insert
            $this->error = null;
        } catch (Exception $ex) {
            //
            //Set the error message
            $this->error = $ex->getMessage();
        } finally {
            //
            //Now execute the bounderd serialization
            $this->insert->execute();
        }
    }

}


//This class groups operations revolving around the arrays $_GET and $_POST
//used for passing data to the server from a client. It is extendded by page.
//It does for PHP what formdata does for JS. Should this then, not be renamed 
//to formdata?
class querystring extends mutall {
    //
    //Hold the query string array here.
    public $arr = [];

    //
    //When input array type, var, is not given we get it from both the $_POST 
    //and $_GET global variables are used to compile the array
    function __construct(array $arr = null) {
        //
        //
        if (is_null($arr)) {
            //
            //Filter the global variable $POST to avoid the direct use of global 
            //variable warning
            $arr = filter_input_array(INPUT_POST);
            //
            //Set this page's array
            $this->arr = is_null($arr) ? [] : $arr;
            //
            //Filter the global variable $GET ditto $POST
            $arr2 = filter_input_array(INPUT_GET);
            //
            //Check where anyting is got
            if (!is_null($arr2)) {
                //
                //Merge the arrays
                $this->arr = array_merge($this->arr, $arr2);
            }
        } else {
            //
            //Use the given (restricted) global source
            $this->arr = $arr;
        }
        //
        //Initialize the parent mutall system
        parent::__construct();
        //
        //We cannot offload the properties of querystring to a page because
        //a page is a querystring and if we do away with the array we will
        //lose track of parameters that were used for calling this page
    }

    //
    //Create a querystrng from the requested global variable
    static function create($var) {
        //
        //Filter the global variable $_GET or $POST to avoid the direct use of global 
        //variable warning
        $arr = filter_input_array($var);
        //
        //Set the array or an empty list if filtering faild
        $arr2 = is_null($arr) ? [] : $arr;
        //
        //Use the array to create the querystring
        return new querystring($arr2);
    }

    //Try to get the value of the named argument of some method to one of the 
    //following:-
    //- the value in the given variable (if valid);
    //- the corresponding indexed value in this querystring's array;
    //- the corresponding property in the given page
    //in that order.
    //The function returns true and binds the value argument variable to the 
    //found value; otherwise it returns false.
    //This method was designed so that a boolean value of false is not intepreted 
    //as a failure of this function. Note that this function does not set the
    //the named property on this object, unlike try_bind_arg version.
    //The page is also a reference variable because with will be re-set if  
    //necessary
    function try_get_arg($name, $variable, &$value, $validate = FILTER_DEFAULT, page &$page = null) {
        //
        //If the page is not given, then assume that this object is a page (not
        //a querystring). This is the reason teh page argument is defiend as a 
        //reference variable.
        if (is_null($page)) {
            //
            $page = $this;
        }
        //
        //Let $v be the value we want;
        $v = null;
        //
        //If the given variable has a valid value, then its the value we want.
        if (!is_null($variable)) {
            //
            $v = $variable;
        }
        //If this query string has an array value indexed by the named argument
        //then its teh value we want
        elseif (isset($this->arr[$name])) {
            //
            $v = $this->arr[$name];
        }
        //
        //If the given page has a prperty named the same as the agument, then 
        //its the one we want
        elseif (isset($page->$name)) {
            //
            $v = $page->$name;
            //
        }
        //
        //We have not found the named argument; return a false
        else {
            return false;
        }
        //
        //Turn the value we want into the correct type -- and bind it to the
        //incoming value
        $value = filter_var($v, $validate);
        //
        return true;
    }

    //Try to bind the given variable to a value resulting from a try_get_arg
    function try_bind_arg($name, &$variable, page &$page = null, $validate = FILTER_DEFAULT) {//querystring
        //
        //Define the value we want
        $value = null;
        //
        //Try to get the value of the named argument.
        if ($this->try_get_arg($name, $variable, $value, $validate, $page)) {
            //
            //Set the variable to the value we found, i.e, bounded earlier
            $variable = $value;
            //
            //Ensure that the property of page with theh same name as teh argument
            //is also set. Note that page is at this point definitely set to a
            //non-null; thatns to having passed it as a reference variable
            $page->$name = $variable;
            //
            return true;
        }
        return false;
    }

    //Bind the named argument of some method to some valid value. Throw an 
    //exception if this is not possible
    function bind_arg($name, &$variable, page &$page = null, $validate = FILTER_DEFAULT) {
        //
        if ($this->try_bind_arg($name, $variable, $page, $validate)) {
            //
            //Return the variable on succesful binding
            return $variable;
        }
        //
        //In future, report both the __CLASS__ and __METHOD__ where this binding
        //was requested. Consider using debug_backtrace and trigger_error() 
        //functions
        throw new Exception("Unable to set argument '$name' for page '$page->classname'");
    }

}

//
//The page is class is thr root of of all muall pages. A page has a database
//associated with it. The most defining aspect of a page is the display_page
//method; there is a driver that is behind the display. By default the driver
//is an sql statement, but it can be overriden by e.g., the xml driver
class page extends querystring {

    //
    //The data, i.e., sql or record, that drives this page's display. Lets 
    //force this property to be accessed via a __GETTER__  method by 
    //protecting it. This means that the driver cannot be accesed by javascript.
    //Thats ok because it carries no primary data. (AFTERTHOUGHT. NO.THAT IS NOT
    //CORRECT. IT CARRIES FIELDS!! WHICH ARE BADLY NEEDED IN JS). The reason 
    //for the magic getter is so that this prOperty will be accessed only when 
    //needed -- not when constructing the page. Then all the properties of the 
    //page being constructed will be available -- thus alowing us the current practice of
    //construcing the parent class before the extended one. (Revert back to 
    //public)
    public $driver;
    //
    //A page index is the name of a field that supplies data to the id attribute
    //of the dom records displayed by this page.
    //The index of an sql is used for:- 
    //(a) formulating the id attribute of a dom record so that we can hreference
    //to that specicic record. (This is partcularly important for the 
    //sql in a selector page)
    //(b) setting the index name property to the id value in (a) when a user
    //selects a dom field
    //The index links a database record to the visual dom a version
    public $index;
    //
    //The javascript expression that is associated with this page. By default
    //the expression has the same name as that of the page. For a dscendant page
    //it is an expression that evaluates to a descendant. This expression is used
    //for contextualizing user actions or events associated with this page. For 
    //instance, the onlick event in a descendant page is qualified as
    //onclick = "page_record.descendants.client.onclick()" where the js 
    //expression is "page_record.descendants.client".
    public $jsxp;
    //
    //The cascaded style sheet (css) expression is used for describing the 
    //position (element-wise) of this page -- so that the css expresion can be 
    //used for locating this page (in a complex document). This expression 
    //is needed to support refreshng of the page related section in an ajax
    //operation. The dafeult it the "article" element
    public $cssxp = "article";
    //
    //The default mode of a page is output
    public $mode_type = mode::output;
    //
    //The default display layout is tabular
    public $layout_type = layout::tabular;
    //
    //Indicates if we should output the header of some table or not.The default 
    //is false, meaning that the headers are needed.
    public $body_only = false;

    //
    //The querystring of a page is mandatory. Note that all the default values
    //are simple data types because they must be inferred from the querystring
    function __construct(querystring $qstring, $dbname = null, $layout_type = null, $mode_type = null, $jsxp = null) {
        //
        //
        //Initialize the parent query string system so that we can access basic 
        //functions for implementing this constructor
        parent::__construct($qstring->arr);
        //
        //Bind the optional argument; this is done after initializing the
        //parent so that we have full access to the srvievs defiend on the 
        //mutall object. The predefined default means that the binding can nver
        //fail.
        //
        //Not all pages need to be associated with a database name; hence this 
        //is optional
        if ($this->try_bind_arg('dbname', $dbname)) {
            //
            $this->dbname = $dbname;
        }
        //
        //Bind the page style
        $this->bind_arg('layout_type', $layout_type);
        $this->bind_arg('mode_type', $mode_type);
        //
        //The default value of the javascript expression for this page is the same 
        //name the class of as this page; this is the justification for the 
        //global js variable to be named the same as this page by default.
        if ($this->try_bind_arg('jsxp', $jsxp)) {
            //
            $this->jsxp = $jsxp;
        } else {
            //
            $this->jsxp = get_class($this);
        }
        //
        //Bind the style objects, viz., layout and mode
        //
        //Set the layout; this can never fail because of the default layout type
        $this->layout = $this->get_layout();
        //
        //Output is the layout; this too cannot fail because of the default mode
        //type
        $this->mode = $this->get_mode();
        //
        //Set this page's driver data; all pages must implement this abstract
        //function. This is 
        $this->driver = $this->get_driver();
    }

    //Implemenet access to the protected variables. 
    function __getter($name) {
        //
        //Check if the variable is already set
        if (__isset($this->$name)) {
            //
            //It is set; return it
            $value = $this->$name;
        } else {
            //
            //Compile the get_ method and execute it. This step will throw an 
            //exception if the method is not defined
            $this->$name = $this->{"get_$name"}();
            //
            //Reurn the property
            $value = $this->$name;
        }
        //
        //Return teh value
        return $value;
    }

    //Display this page
    function display_page() {//page
        //
        //Use the query string to return the display style variables, viz., layout and 
        //display mode.
        $layout = $this->get_layout();
        $mode = $this->get_mode();
        //
        //Use this page's driver to display data. Different drivers display the
        //data differently
        $this->driver->display_data($this, $layout, $mode);
    }

    //By default, the foolter has nothing. In an invoice table the fotter has 
    //the totals for each column
    function display_footer() {
        
    }

    //Display the header(section) of a layout; this is valid only for tabular 
    //layout
    function display_layout_header(driver_sql $sql, layout $layout) {
        //
        //This is valid only for tabular layouts
        if ($layout->type != layout::tabular) {
            return;
        }
        //
        echo "<tr>";
        //
        //The first header cell is that of a checkbox reserved for selecting 
        //the entire row. Output it only if necessary
        echo "<th ";
        //Show the cehckbocx if needed; by default it is not needed
        $this->hide_check_box();
        echo ">";
        echo "checked";
        echo "</th>";
        //
        //Display the fields; this is made a standalone function so that it can
        //be ovveridden, e.g., wheh doing crosstabs
        $this->display_header_fields($sql);
        //
        echo"</tr>";
    }

    //Display the header fields of this page to complete the display page. This 
    //is developed as a standalone function so that it can be overidden, e.g., 
    //when doing crosstabs
    function display_header_fields(driver_sql $sql) {//page
        //
        //Visit all the fields of the given sql and output each one of them 
        //as a "th" element.
        foreach ($sql->fields as $field) {
            //
            echo "<th";
            //
            //Hide/show this field -- depending on the page
            echo $field->is_hidden($this) ? " hidden='true'" : "";
            //
            echo ">";
            //
            //Show the field name. In future we look for the more friendly label 
            //in the field's comment.
            echo $field->name;
            //
            //Close the header
            echo "</th>";
        }
    }

    //Remove the limit to a page size even if it is specified; this is important 
    //when we want to display all records of a page derived from an sql_edit 
    //driver -- thus ovrrding the default behaviour.
    function no_limit() {
        //
        //For a no limit specification to be valid, the no_limit specification
        //must be found in this page's query string
        if (!isset($this->arr['no_limit'])) {
            return false;
        }
        //
        //The no limit must be set to some boolean value
        $no_limit = filter_var($this->arr['no_limit'], FILTER_VALIDATE_BOOLEAN);
        //
        //Return teh boolean value
        return $no_limit;
    }

    //
    //By default, the driver of a page is null. 
    //
    //Compile the default driver of a page from the querystring data, if it is 
    //possible. If not, return a null; you will get a runtime error if you
    //try to reference a null driver.
    function get_driver() {
        //
        //Test if the driver type is specified
        if (!isset($this->arr['driver_type'])) {
            return null;
        }
        //
        //Get the driver type
        $type = $this->arr['driver_type'];
        //
        //Get the driver type
        switch ($type) {
            //
            //An sql driver
            case "sql":
                //
                //Get the sql statement from the query string array variables. It must 
                //be set
                if (!isset($this->arr['sql'])) {
                    throw new Exception("No sql statement was found to drive page $this->name");
                }
                //
                //Get the statement
                $stmt = $this->arr['sql'];
                //
                //Get the current database
                $dbase = $this->get_dbase();
                //
                //Make a new sql object and return it as the driver; theh fields will be 
                //derived from the statement
                return new sql($dbase, $stmt);
            default:
                throw new Exception("Driver type $type is not known");
        }
    }
    //
    //Display the content of a record on this page; that depends on the page. This
    //function was introduced so that we could override how a record is displayed.
    //By default, we display the fields
    function display_record(driver_record $record, $layout = null, $mode = null) {//page
        //
        //Display all the record's fields
        foreach ($record->fields as $field) {
            //
            //Display the field; its parent source is this record being displayed
            $field->display_data($this, $layout, $mode, $record);
        }
    }

    //Closing a page effectively cloes the database connection associated
    //with it
    function close() {
        //
        //Do nothing if dbase is not set
        if (!isset($this->dbase)) {
            return;
        }
        //Do nothing if dbase is null
        if (is_null($this->dbase)) {
            return;
        }
        //
        //Otherwise close the dbase
        $this->dbase->close();
    }

    //
    //By default, forreign key columns are shown in all pages. However, in a 
    //decendant, it is hident if its name matches the parent table
    function hide_foreign_keyfield(column_foreign $field) {
        //
        return false;
    }

    //retuens the layout of this page
    function get_layout() {
        //
        //By this time, the layout type must have been set
        switch ($this->layout_type) {
            //
            case layout::label:
                $layout = new layout_label();
                break;
            //
            case layout::tabular:
                $layout = new layout_tabular();
                break;
            //
            //The unsepcified layout is assumed to be tabular
            case null:
                $layout = new layout_tabular();
                break;
            default:
                throw new Exception("Layout type '$this->layout_type' is not known");
        }
        //
        return $layout;
    }

    //Returns the display mode of this page
    function get_mode() {
        //
        //By this time the display mode must have been set
        switch ($this->mode_type) {
            //
            case mode::input:
                $mode = new mode_input();
                break;
            //
            case mode::output:
                $mode = new mode_output();
                break;
            default:
                throw new Exception("Display mode '$this->mode_type' is not known");
        }
        //
        //Return the mode style
        return $mode;
    }

    //Returns the value of the named qreystring property; by default, the input 
    //is not boolean. It is text
    function get_qstring_value($name, $is_boolean = false) {
        //
        //If the named property exists, return its value; oterwise set value 
        //to nothing
        $value = isset($this->arr[$name]) ? $this->arr[$name] : "";

        //Formulate the correct propertyu for boolean and other cases
        if ($is_boolean) {
            //
            //Filter the boolean value
            $checked = filter_var($value, FILTER_VALIDATE_BOOLEAN);
            //
            //Ourput the property; note the leading and trailing spaces
            $property = $checked ? " checked='true' " : "";
        } else {
            $property = $value !== "" ? "value='$value' " : "";
        }
        //Return the property
        return $property;
    }

    //By default the checkbox is shown; by default no checkbox is shown on any 
    //page. For certain operations that erquire more than one selection, e.g., merging, 
    //the checkbox is needed
    function hide_check_box() {
        //
        //By default, the selector is not needed
        $is_needed = false;
        //
        //Check the querystring data
        if (isset($this->arr['selector'])) {
            //
            $is_needed = filter_var($this->arr['selector'], FILTER_VALIDATE_BOOLEAN);
        }
        //
        if (!$is_needed) {
            echo " hidden='true'";
        }
    }

}

//The page home class is used for extending websites. Typically it is driven by
//an xml document formatted using some schema. Whst is the xsd of the schema and
//how can it be used to verify that a website is well formatted?
class page_home extends page {

    //For websites that are driven by an xml document we expect a file named
    //$website.xml
    public $website;
    //
    //
    public $dbname;
    //
    //creating the constructor for this class
    function __construct(querystring $qstring, $website = null, $dbname = null) {
        //
        $qstring->bind_arg('website', $website, $this);
        $qstring->bind_arg('dbname', $dbname, $this);
        //
        //Construct teh parent page
        parent:: __construct($qstring);
    }
    
    //Returns the xml driver of this document
    function get_driver() {
        //
        return new driver_xml("../$this->website/$this->website.xml", $this->dbname);
    }

    //Execute a user request if any
    function execute_request() {
        //
        //Trap errors so they they are reported by the remote server
        try {
            //
            $dbase = $this->driver->dbase;
            //
            //Retrieve the requests -- if any
            if (isset($this->arr['request'])) {
                //
                //Yes, there are requests
                $request = $this->arr['request'];
                //
                switch ($request) {
                    //
                    //Echo to android all the defind jobs
                    case "getjobs":
                        //
                        //Retrieve the sql;
                        $stmt = $dbase->query("
                            select
                                job.name,
                                job.dbname
                            from
                                job
                        ");
                        //
                        //
                        $jresult = $stmt->fetchAll();

                        //
                        $fresult = json_encode($jresult);
                        //
                        echo $fresult;
                        break;
                    default:
                        die("Invalid request $request");
                }
            } else {
                header("location:home.php");
            }
        } catch (Exception $ex) {
            echo $this->get_error($ex);
        }
    }
    
    //
    function display_definers() {

        //Create a new xml document
        $xml = new DOMDocument;
        //
        //Load the source file and test for errors
        $xml->load("$this->website.xml");
        //
        //Load the identity translation style sheet
        $xsl = new DOMDocument;
        $xsl->load('../library/definers.xsl');
        //
        // Configure the transformer
        $proc = new XSLTProcessor;
        $proc->importStyleSheet($xsl); // attach the xsl rules
        //
        //Do the transform. Is there any ststus code?
        $result = $proc->transformToDoc($xml);
        //
        //Save to a text stringn
        $txt = $result->saveHTML();
        //
        echo $txt;
    }
    
    //
    function display_services() {

        //Create a new xml document
        $xml = new DOMDocument;
        //
        //Load the source file and test for errors
        $xml->load("$this->website.xml");
        //
        //Load the identity translation style sheet
        $xsl = new DOMDocument;
        $xsl->load("../library/services.xsl");
        //
        // Configure the transformer
        $proc = new XSLTProcessor;
        $proc->importStyleSheet($xsl); // attach the xsl rules
        //
        //Do the transform. Is there any ststus code?
        $result = $proc->transformToDoc($xml);
        //
        //Save to a text stringn
        $txt = $result->saveHTML();
        //
        echo $txt;
    }
    
    //
    function display_page() {
        //
        // Load the XML source
        // 
        //Create a new xml document
        $xml = new DOMDocument;
        //
        //Load the source file and test for errors
        $xml->load("$this->website.xml");
        //
        //Load the identity translation style sheet
        $xsl = new DOMDocument;
        $xsl->load('../library/identity.xsl');
        //
        // Configure the transformer
        $proc = new XSLTProcessor;
        $proc->importStyleSheet($xsl); // attach the xsl rules
        //
        //Set parameter on the processor
        //$proc->setParameter("","lang",$lang);
//        $proc->setParameter("", "user", $_SESSION['admin']);
//        $new_proc = $proc->transformToXml($xml);
        //
        //Do the transform. Is there any ststus code?
        $result = $proc->transformToDoc($xml);
        //
        //Save to a text stringn
        $txt = $result->saveHTML();
        //
        echo $txt;
    }
    
    //load the clients from the server and display to the client
    function load_client() {
         //
       $i = $this->arr['i'];
       
        //Query the database
        $mysqli_result = $this->dbase->query("
            select 
                client.name, 
                client.logo, 
                client.website
            from 
                client        
        ");
        //
        //Loop thru all the retrievd data
        while ($result = $mysqli_result->fetch_assoc()) {
            echo"<div class = 'flex'>";
            echo "
                <img src='pictures/logo/{$result['logo']}'></img> </br>
                <h3>{$result['name']}</h3></br>";
                //
                //
                if(!empty($result['website'])){
                    echo "<a href='{$result['website']}'>Find Out More</a>";
                }
                else {
                    echo "<a href='{$result['website']}' class='progress'>In Progress</a>";
               }
            echo "</div>";
        }
        //
        return $i;
    }
    //display staff using the load function
    function load_staff() {
        //
        //
        //Assign the id to be loaded
        $i = $this->arr['i'];
        //
        //Query the database
        $mysqli_result = $this->dbase->query("
            select 
                staff.name, 
                picture.image,
                staff.role
            from 
                staff inner join picture on staff.staff = picture.staff        
        ");
        //
        //lopping through the results
        while ($result = $mysqli_result->fetch_assoc()) {
            echo "
            <div class = 'flexstaff'>
                <img src='pictures/staff/{$result['image']}'></img> </br>
                <h3>{$result['name']}</h3></br>
                {$result['role']}</br>
            </div>
            ";
        }
        return $i;
    }
    
    //Execute_job
    //Start the web support services
    //Select a record to allow for editing
    function select_page ($id=null, $children=null){
         
        //Get the xml document
        $domdoc = $this->driver->xml;
        //
        //Retrieve the record id using from the incoming arguments (if valid) 
        //or from the posted query string
        $this->bind_arg('id', $id);
        $this->bind_arg('children', $children);
        
        //
        //using the id assigned to the xpath command, retrieve the node associated with the id
        $xpath = new DOMXPath($domdoc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        //Output the children of this node as cannonicalized versions
        //
        if (is_null($node)){
            throw new exception ('Node $id not found');
        }
        //
        //Add buttons to record
        echo "
        <button onclick='$this->website.edit_page(this)'>Edit</button>
        <button onclick='$this->website.insertrecord(this, 1)'>Insert Above</button>
        <button onclick='$this->website.insertrecord(this, 3)'>Insert Below</button>
        <button onclick='$this->website.save(this)'>Save</button>
        <button onclick='$this->website.discard(this)'>Discard</button>
        <button onclick='$this->website.delete(this)'>Delete</button>
        <children>
        $children
        </children>";
        
        return $id;
        
     }
       
    //Output the html code to support Edit of the selected record
    function edit_page ($id=null){
         
        //Get the xml document
        $domdoc = $this->driver->xml;
        //
        //Retrieve the record id using the incoming arguments (if valid) 
        //or from the posted query string
        $this->bind_arg('id', $id);
        //
        //using the id assigned to the xpath command, retrieve the node associated with the id
        $xpath = new DOMXPath($domdoc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        if (is_null($node)){
            throw new exception ('Node $id not found');
        }
        //
        //Output the children of this node as canonicalized versions in a text area
        echo '<textarea>';
        for($i=0; $i<$node->childNodes->length; $i++){
            //
            //Get the i'th child
            $child = $node->childNodes[$i];
            //
            //Output the cononicalized version of the child
            echo $child->C14N();
        }
        echo '</textarea>';
        
        return $id;
        
     }  
     
    //Replace the identified record element (in the current document) with the 
    //given xml fragment
    function save($id=null, $children_xml=null){
        //
        //Retrieve the record id and its replacement xml from the incoming 
        //arguments (if valid) or from the posted query string
        $this->bind_arg('id', $id);
        $this->bind_arg('xml', $children_xml);
        //
        //Replace the identified xml with the retrieved fragment
        //
        //Get the xml document
        $doc = $this->driver->xml;
        
        //Get the node to replace, i.e., the one associated with the id for 
        //saving
        $xpath = new DOMXPath($doc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        //Get the parent of this node
        $parent = $node->parentNode;
        //
        //Convert the replacement xml fragment (text) into an xml document
        $replacement_doc = new DOMDocument();
        //
        //Compile the full record xml
        $xml="
            <record id='$id'>$children_xml</record>
        ";
        //
        $replacement_doc->loadXML($xml);
        //
        //Get the root element of the replacement document
        $replacement_root=$replacement_doc->documentElement;
        //
        //Import the replacement node to the current document with all its children
        $replacement = $doc->importNode($replacement_root, true);
        //
        //Do the replacement
         $parent->replaceChild($replacement, $node);
        //
        //Write Domdocument to the disk file
        $doc->save($this->driver->file);
        //
        //Send the id and xml back to teh client for confiremation of sucess
        $extra = new stdClass(); 
        $extra->id=$id;
        $extra->xml=$xml;
        return $extra;
    }
    
    //Deleting selected node
    function delete($id=null){
        //Get the xml document
        $doc = $this->driver->xml; 
        //
        //Retrieve the record id using the incoming arguments (if valid) 
        //or from the posted query string
        $this->bind_arg('id', $id);
        
        //
        //Get the node to delete. The node is associated with the id
        $xpath = new DOMXPath($doc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        //Get the parent of this node
        $parent = $node->parentNode;
        //
        //Remove the node and its children
        $parent->removeChild($node);
        //
        //write back the document to the file
        $doc->save($this->driver->file);
        //
        return $id;
    }
    
    //Create a new xml as children of the new record to be inserted before
    function insertrecord($id=null){
        
        //
        //Retrieve the record id to be inserted above from the incoming 
        //arguments (if valid) or from the posted query string
        $this->bind_arg('id', $id);
        
        
        
        //
        //Generate a new record with the incoming new id and add buttons and 
        //textarea to it
        $new_xml="
           
                <button onclick='$this->website.edit_page(this)'>Edit</button>
                <button onclick='$this->website.save_record(this)'>Save</button>
                <button onclick='$this->website.discard_insert(this)'>Discard</button>
                <textarea></textarea>
           
        ";
        //
        //Send the id and the new xml back to the client for confiremation of sucess
        $extra = new stdClass(); 
        $extra->id=$id;
        $extra->new_xml=$new_xml;
        return $extra;
    }
    
    //Save the values of the textarea to the new record inserted
    function save_record($id=null, $id3=null, $children_xml=null){
        $position = null;
        //
        //Retrieve the record id and its replacement xml from the incoming 
        //arguments (if valid) or from the posted query string
        $this->bind_arg('id', $id);
        $this->bind_arg('xml', $children_xml);
        $this->bind_arg('id3', $id3);
        $this->bind_arg('position', $position);
        //
        //Replace the identified xml with the retrieved fragment
        //
        //Get the xml document
        $doc = $this->driver->xml;
        
        //Get the node to replace, i.e., the one associated with the id for 
        //saving
        $xpath = new DOMXPath($doc);
        $node= $xpath->query("//*[@id='$id3']")->item(0);
        //
        //Get the parent of this node
        $parent = $node->parentNode;
        //
        //Convert the inserted xml fragment (text) into an xml document
        $inserted_doc = new DOMDocument();
        //
        //Compile the full record xml
        $xml="
            <record id='$id'>$children_xml</record>
        ";
        //
        //Load the xml document
        $inserted_doc->loadXML($xml);
        //
        //Get the root element of the inserted document
        $inserted_root=$inserted_doc->documentElement;
        //
        //Import the inserted node to the current document with all its children
        $replacement = $doc->importNode($inserted_root, true);
        //
        //Do the replacement
        if ($position === "1"){
            $parent->insertBefore($replacement, $node);
        }
        else{
           $parent->insertBefore($replacement, $node->nextSibling); 
        }
         
        //
        //Write Domdocument to the disk file
        $doc->save($this->driver->file);
        //
        //Send the id and xml back to teh client for confiremation of sucess
        $extra = new stdClass(); 
        $extra->id=$id;
        $extra->xml=$xml;
        return $extra;
    }
    
    //Start editing of the content
    function select_content ($id=null, $children=null){
         
        //Get the xml document
        $domdoc = $this->driver->xml;
        //
        //Retrieve the content id using from the incoming arguments (if valid) 
        //or from the posted query string
        $this->bind_arg('id', $id);
        $this->bind_arg('children', $children);
        
        //
        //using the id assigned to the xpath command, retrieve the node associated with the id
        $xpath = new DOMXPath($domdoc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        //Output the children of this node as cannonicalized versions
        //
        if (is_null($node)){
            throw new exception ('Node $id not found');
        }
        //
        //Add buttons to record
        echo "
        <button onclick='$this->website.edit_content(this)'>Edit</button>
        <button onclick='$this->website.save_content(this)'>Save</button>
        <button onclick='$this->website.discard_content(this)'>Discard</button>
        <children>
        $children
        </children>";
        
        return $id;
        
     }
     
    //Output the html code to support Edit of the selected content
    function edit_content ($id=null){
         
        //Get the xml document
        $domdoc = $this->driver->xml;
        //
        //Retrieve the record id using the incoming arguments (if valid) 
        //or from the posted query string
        $this->bind_arg('id', $id);
        //
        //using the id assigned to the xpath command, retrieve the node associated with the id
        $xpath = new DOMXPath($domdoc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        if (is_null($node)){
            throw new exception ('Node $id not found');
        }
        //
        //Output the children of this node as canonicalized versions in a text area
        echo '<textarea>';
        for($i=0; $i<$node->childNodes->length; $i++){
            //
            //Get the i'th child
            $child = $node->childNodes[$i];
            //
            //Output the cononicalized version of the child
            echo $child->C14N();
        }
        echo '</textarea>';
        
        return $id;
        
     }
     
    // 
    function save_content($id=null, $children_xml=null){
        //
        //Retrieve the record id and its replacement xml from the incoming 
        //arguments (if valid) or from the posted query string
        $this->bind_arg('id', $id);
        $this->bind_arg('xml', $children_xml);
        //
        //Replace the identified xml with the retrieved fragment
        //
        //Get the xml document
        $doc = $this->driver->xml;
        
        //Get the node to replace, i.e., the one associated with the id for 
        //saving
        $xpath = new DOMXPath($doc);
        $node= $xpath->query("//*[@id='$id']")->item(0);
        //
        //Get the parent of this node
        $parent = $node->parentNode;
        //
        //Convert the replacement xml fragment (text) into an xml document
        $replacement_doc = new DOMDocument();
        //
        //Compile the full record xml
        $xml="
            <content id='$id'>$children_xml</content>
        ";
        //
        $replacement_doc->loadXML($xml);
        //
        //Get the root element of the replacement document
        $replacement_root=$replacement_doc->documentElement;
        //
        //Import the replacement node to the current document with all its children
        $replacement = $doc->importNode($replacement_root, true);
        //
        //Do the replacement
         $parent->replaceChild($replacement, $node);
        //
        //Write Domdocument to the disk file
        $doc->save($this->driver->file);
        //
        //Send the id and xml back to teh client for confiremation of sucess
        $extra = new stdClass(); 
        $extra->id=$id;
        $extra->xml=$xml;
        return $extra;
    }
    

}

//
//Modelling a login page; The justification for this being in the library is 
//to allow other pages, e.g., page_buis, to access the login/out 
//the functionality implemented by the page_login class. 
class page_login extends page {

    //
    //These are the administrators login credentials for accessing the 
    //information schema. On set up, the site admin will modify these constants
    //with his/her credentials so that the information schema table oon that site
    //can be accessed

    const username = "mutallco";
    const password = "mutall_2015";
    //
    //The database that drives the mutall home page
    const mutall_data = "mutallco_data";

    //
    //The logged in credentials
    public $username = null;
    public $clientid = null;

    //
    function __construct(querystring $qstring) {
        //
        $this->layout_type = layout::label;
        $this->mode_type = mode::input;
        //
        //Now call the parent page initializer. 
        parent::__construct($qstring);
        //
        //Set the login status, i.e., the user name and clientid, from the 
        //session variables
        if (isset($_SESSION['login'])) {
            $this->username = $_SESSION['login']['username'];
            $this->clientid = $_SESSION['login']['clientid'];
        }
    }

    //The login page is special in that it is driven by a record that is NOT
    //derived from an sql statement executed on a database
    function get_driver() {//page_login
        //
        //Set this page's data component; its of record type.
        //
        //Define the user name and password fields. The mutall field is the 
        //smallest database savable, i.e., data that can be saved as a unit, element
        $fusername = new driver_field("username");
        $fpassword = new driver_field("password");
        //
        //Collect the user login credentials as a list of indexed fields
        $fields = array("username" => $fusername, "password" => $fpassword);
        //
        //Create a record using the fields onnly, i.e., without reference to
        //a database and its data sources -- table name or sql statement.
        //But, the Mutall record is an extension of a writeable object. A 
        //writeable must have a database. This is contradictory
        $record = new driver_record($fields);
        //
        //Optional arguments can be supplied after the page creation
        //
        //Create an empty list of the record's values
        $record->values = new stdClass;
        //
        //Look for the login credentials from the session variable
        $login = null;
        //
        if ($this->try_login($login)) {
            //
            //Populate the record values with available login credentials
            $record->values->username = $login['username'];
            $record->values->password = $login['password'];
        }
        //
        return $record;
    }

    //Request the server to check the login credentials against registered
    //clients. If registerd, return the clientid; if report user not found
    function check_login($username = null, $password = null) {
        //
        //Bind the arguments from the querystring 
        $this->bind_arg('username', $username);
        $this->bind_arg('password', $password);
        //
        //Check teh credentials against the clients table in the mutall_data
        //database
        $mutall_data = new dbase_mutall_data();
        //
        $result = $mutall_data->query("
            select
                client.client
            from
                mutallco_data.client
            where
                client.name='$username' and
                client.password='$password'    
        ");
        //
        $row = $result->fetch_row();
        //
        //Create a new user object to return
        $user = new stdClass();
        //
        if (!$row) {
            //
            $user->found = false;
        } else {
            //
            //A user has been found
            $user->found = true;
            //
            //Set the client id
            $user->clientid = $row[0];
            //
            //Save the credentials to the session variables
            //
                //Save the username
            $_SESSION['login']['username'] = $username;
            $_SESSION['login']['clientid'] = $user->clientid;
        }
        //
        $mutall_data->close();
        //
        //Return theh user object as teh extra data
        return $user;
    }

    //To logout is to simply destroy the session variables
    function logout() {
        //
        session_destroy();
    }
}


//Layout allows us us to manage the different styles of arranging data 
//presentations on a page. It is an abstract class; that means that tthe user
//has to create the descenant classes explicity
abstract class layout extends mutall {
    //
    //Names of the layout types
    const tabular = "tabular";
    const label = "label";
    //
    //Type of layout
    public $type;
    //
    //The field and record tag names used by the layout to markup a html page
    public $field_tag_name;
    public $record_tag_name;
    public $envelop_tag_name;
    //
    //Every layout must tell us how the fields and records in a html document
    //are demarcated. 
    function __construct($type) {
        //
        $this->type = $type;
        //
        //Initialize the top level mutall object
        parent::__construct();
    }

    //By default, a layout has no field label. A labeled layout does
    function show_label_name($fname) {//layout
    }

}

//The tabular layout is used by all pages that need to present data as a 
//standard table.
class layout_tabular extends layout {

    //
    function __construct() {
        //
        $this->field_tag_name = "td";
        $this->record_tag_name = "tr";
        //
        //This is the equivalent of the tbody in a tabular layout
        $this->body_tag_name = "tbody";
        //
        //Envelop is the table equivalent in a tabular layout
        $this->envelop_tag_name = "table";
        //
        //Initialize the layout system
        parent::__construct(layout::tabular);
    }

}

//The label layout format
class layout_label extends layout {

    //
    function __construct() {

        $this->field_tag_name = "label";
        $this->record_tag_name = "record";
        //
        //This is the equivalent of the tbody in a tabular layout
        $this->body_tag_name = "records";
        //
        //Envelop is the table equivalent in a tabular layout
        $this->envelop_tag_name = "envelop";
        //
        //Initialize the parent layout
        parent::__construct(layout::label);
    }

    //Display the label of a field
    function show_label_name($fname) {//label
        //
        //Formulate the label tag of the field. The normal style is described 
        //in mutall.css
        echo "<span class='normal'";
        //
        //Close the label attributes
        echo ">";
        //
        //Display the label text. In future, use the field's comment as
        //teh source of a more friendly. 
        echo $fname;
        //
        //Close the label
        echo "</span>";
    }

}

//The mode of displaying the data. Currently only one property is known:type. Why
//promote this to a class then? To allow the use of a display arguement that 
//whose class is known, e.g., display(layout $x, mode $y) 
//class. It is an abstract class, so that we canot create objects out of it. This
//means we have to creat wither input ot output modes explicitly
abstract class mode extends mutall {

    //
    //Types of mode of presentng data in any layout
    public $type;

    //
    //The data can be edited
    const input = "mode_input";
    //
    //The data is highly formated but cannot be edited
    const output = "mode_output";

    function __construct($type) {
        //
        $this->type = $type;
        //
        //Initalize the parent mutall object
        parent::__construct();
    }

    //Returns the hidden attribute or nothing depending on the specfifed
    //mode type
    function hidden($mode_type) {
        //
        //If the given mode type matches that of creating this mode tyoe, then 
        //it should be shown, i.e., there is no hidden attribute
        return ($this->type === $mode_type) ? "" : " hidden=true";
    }

}

//The input mode. The justification for mode extensions is so that we can
//activate these classes without requirring any arguments
class mode_input extends mode {

    //
    function __construct() {
        //
        parent::__construct(mode::input);
    }

}

//The output mode
class mode_output extends mode {

    //
    function __construct() {
        //
        parent::__construct(mode::output);
    }

}

//Driver is the source of data that drives the display of a page. Record, Sql and
//xml  are all derivetives of a driver
abstract class driver extends mutall {
    //
    //The fields of a page driver can range from basic ones to complex cases
    //e.g., the column_primary and column_forein are cases comprises of multiple 
    //sub-fields.
    //
    //Fields used for deriving the selected columns of an sql. They are pubic 
    //because they need to be passed to the client applications (vis json strings)
    //Is fields's readdy a propertyu of a driver?? Not  very sure!!!!What about 
    //the xml driver
    public $fields;
    //
    //A driver has a parent (driver); to avoid recursion, this should be protected
    protected $parent;

    //
    function __construct() {
        //
        //Initialize the parent mutall class
        parent::__construct();
    }

    //Display data (as opposed to display page). Every mutall data must be 
    //displayable in teh style of the given page. In effect
    //display is the process that puts all basic mutall objects together. The 
    //parent is required for a fuller display. E.g., to display a hyperlink
    //we require the value (the actual href) and the more friendly name which
    //can only be obtained from the parent record
    abstract function display_data(page $page, layout $layout, mode $mode, driver $parent = null);

    //Write the data represented by this page driver to the database. 
    //(write_data() is easier to search than just write())
    abstract function write_data();

    //Saving this driver's data to the database does 2 things:
    //1- it writes the data to the database
    //2- it uploads files associated with this page to the server
    function save_data() {
        //
        //Write the data to the given database; that depends on the data object
        //(write_data is easier to search than just write)
        $this->write_data();
        //
        //Upload (picture) files to the server
        $this->upload_files();
    }

    //Mark the hidden fields on the given page
    function mark_hidden_fields(page $page) {
        //
        //Get the hiddenn property of the page's query string
        //
        //First check wethether suh a propertyu exists
        if (isset($page->arr['hidden_fields'])) {
            //
            //Get the hidden fields string
            $str = $page->arr['hidden_fields'];
            //
            //Convert the string to a list
            $hidden_list = explode(",", $str);
            //
            //Loop through all the fields of this driver and mark as hidden 
            //every field name in the hidden list
            foreach ($this->fields as $field) {
                //
                $field->hidden = in_array($field->name, $hidden_list) ? true : false;
            }
        }
    }

    //Upload all the necessary (image) files; 
    function upload_files() {
        //This process is valid oly if there are files to upload
        if (count($_FILES) === 0) {
            return;
        }
        //
        //Set the image directory as a subdirectory of current
        $images = "images";
        //
        //Exit if the image folder does not exist on teh server
        if (!file_exists($images)) {
            die("Folder $images does not exist on the server");
        }
        //
        //Upload valid file brought to the server
        foreach ($_FILES as $file) {
            //Retrieve the basename of the file
            $basename = $file['name'];
            //
            //Uploading is not valid for empty file name
            if ($basename == "") {
                continue;
            }
            //
            //Compile the absolute path on the server subfolder where the image will
            //be saved. We assume the same drive as this page. The relative one will 
            //not do for data movement on the server. Note the direction of the 
            //slashes (assuming a Windows server) to desigate an OS path
            $fullname = "$images/$basename";
            //
            //If the file exists do not overwite it
            if (file_exists($fullname)) {
                continue;
            }
            //
            //Transfer the temp filename to the correct server path -- using absolute
            //paths. If for any reason the move is not successful alert the user
            if (!move_uploaded_file($file["tmp_name"], $fullname)) {
                //There was an issue: report it
                echo "Error in uploading to file '$fullname'";
            }
        }
        return true;
    }

}

//A field is teh most basic of a driver. Ita parent is a record
class driver_field extends driver {

    //
    //Constants that define special field names in an sql statement. The leading
    //_ is added to prevent possibilities of mixing up these special names with
    //user defined field names.
    //
    //The name of the primary key field; this field is useful for data updates
    const primary = "_primary";
    //
    //The id field of an sql column is used for hreferencing to a data row
    const id = "_id";
    //
    //The output field is the visible and friendly representation of the 
    //primary key data
    const output = "_output";
    //
    //The indexes associated with subfields of a relation field, i.e, primary
    //or foreign key field. These are important for accesing specific subfields 
    const map = array(
        "primary" => self::primary,
        "id" => self::id,
        "output" => self::output
    );

    //The name of this field
    public $name;
    //
    //The titke of a fiels is is long friendly name
    public $title;
    //
    //The field value (expression) is important for formulating sql statements
    //for selecting data. This makes sense only for the basic fields. Compound
    //fields, e.g., the foreign key, do not have a xvalue; their subfields do. 
    public $xvalue;
    //
    //The (visible) value of a field; in contrast, xvaluue is an expression 
    public $value;
    //See if a feld needs to be totalle or not
    public $is_totalled = false;
    public $total = 0;
    //Marks field as eiher hidden or not. Hidden fields are not displayed
    public $hidden = false;

    //
    //A basic field is characterised by a value of type expression and an 
    //optional name
    function __construct($name, expression $xvalue = null, $title = null) {
        //
        $this->name = $name;
        $this->title = $title;
        //
        //If there is no value, use teh null expression
        $this->xvalue = is_null($xvalue) ? new expression_null : $xvalue;
        //
        //Initialize the inherited driver
        parent::__construct();
    }

    //The input html tag of a normal field is a text input box for a normal fiels
    function display_input_tag(page $page, mode $mode, driver_record $parent) {//field
        //
        $fname = $this->name;
        //
        echo "<input";
        //
        //The default input type is text; it is password if the field
        //name suggests so.
        if ($fname === "password") {
            echo " type='password'";
        }
        //
        //By default the type is plain text
        else {
            echo " type='text'";
        }
        //
        echo " name='$fname'";
        //
        //Retrieve the (input) value of this field from the parent record's 
        //property that matches the field name
        $value = isset($parent->values->$fname) ? $parent->values->$fname : "";
        //
        //Display the input value
        echo " value='$value'";
        //
        //Echo the hidden status
        echo $mode->hidden(mode::input);
        //
        //Close the input
        echo " />";
    }

    //The output html element of a normal field is some text content
    function display_output_tag(page $page, mode $mode, driver_record $parent) {
        //
        //Open our own user-defined output tag
        echo "<output";
        //
        //Hide this data if the output mode is input
        echo $mode->hidden(mode::output);
        //
        //Close the data arguments
        echo ">";
        //
        //Output the value of this field as the text content -- if it exists
        //from the parent record's values
        echo isset($parent->values->{$this->name}) ? $parent->values->{$this->name} : "";
        //
        //Close data tag
        echo "</output>";
    }

    //An ordinary field cannot write data to a database
    function write_data() {//field
        throw new Exception("A field cannot write data to a database. In contrast, a column can");
    }

    //Set the value of a field
    function set_value() {//field
        //
        //Get the name of the field
        $fname = $this->name;
        //
        //Verify that the parent is set
        if (isset($this->parent->values->$fname)) {
            $this->value = $this->parent->values->$fname;
        } else {
            $this->value = $this->get_default_value();
        }
    }

    //The defeault value of a field is a null
    function get_default_value() {
        return null;
    }

    //Tests if this field is part of the default id index of the reference table 
    //in which it is taking part
    function field_is_id($dbase) {
        //
        //Get this field's value
        $xvalue = $this->xvalue;
        //
        //Identification values are always column exressions
        if (get_class($xvalue) === "expression_column") {
            //Get the expression;s table name
            $tname = $xvalue->tname;
            //
            //Get the expression's field name
            $fname = $xvalue->fname;
            //
            //Get teh named table from the global database
            $table = $dbase->get_table($tname);
            //
            //Get the default index of this columns source table
            $cols = $table->first_index_cols();
            //
            //See if this column exists
            return array_key_exists($fname, $cols);
        }
        //Otherwise this cannot be an indetification field
        else {
            return false;
        }
    }

    //Returns the displayable value of this field. If necessary be, set it
    //to the default
    function field_value() {//field
        //
        //Rteurn this value
        return $this->value;
    }

    //By default an ordinary field cannot be modified using database insert and
    //update methods; the only known modifiable fields are column and 
    //column_foreign. The rationale here is that field is a derived column
    function is_modifiable() {
        return false;
    }

    //A field is hidden if its hidden attribute is set. The hiding is done
    //during the creation of a field
    function is_hidden(page $page) {//field
        //
        return isset($this->hidden) && $this->hidden ? true : false;
    }

    //Tries to return the writable value of a field from the given list. If the
    //list is missing, we try to get it from this mutall object.
    //An ordinary field cannot be written to a database and it is illegal to try 
    //to do so; in contrast, a table column can. 
    function try_writable_value($values = null, &$value) {
        throw new Exception("Field named $this->name of type get_class($this) cannot be modified");
    }

    //A basic field splits into itself
    function split() {//field
        yield $this;
    }

    //Returns the alias of a field depending on whether the name is given or not
    function alias() {
        //
        if ($this->name) {
            //
            return " AS `" . $this->name . "`";
        }
        //Otheerwise the default is no alias
        return "";
    }

    //The expression value of a basic string...
    function __toString() {
        return (string) $this->xvalue;
    }

    //Display the data for this field. The parent of a field is the record from 
    //which it was derived.
    function display_data(page $page, layout $layout, mode $mode, driver $record = null) {//field
        //
        //Get the field name
        $fname = $this->name;
        //
        //Open the dom field tag to start outputting the attributes.
        echo "<$layout->field_tag_name";
        //
        //Add the click event that should mark this dom field. This is a mutall
        //function that is reached from a javascript expression 'page->jsxp'.
        //By default the expression has the same value as some variable named
        //the same as the page and created when the page is loaded.
        echo " onclick='$page->jsxp.select_dom_field(this)'";
        //
        //Add a name to this field tag; it is needed for referencing it
        echo " name='$fname'";
        //
        //Hide/show this field -- depending on the page
        echo $this->is_hidden($page) ? " hidden='true'" : "";
        //
        //Close the dom field properties
        echo ">";
        //
        //The label class is valid only for the labels layout
        //
        $layout->show_label_name($fname);
        //
        //Display the metadata, input and output data for this field; the metadata 
        //are hidden; so is either the input or output data -- depending on the
        //edit mode
        $this->display_value($page, $mode, $record);
        //
        //Close the fied tag name
        echo "</$layout->field_tag_name>";
    }

    //The display value of any field value comprises of 3 tags: a mandatory 
    //output,an optional input and other supporting metadata. The metadata are 
    //always hidden. The input (or output) data is hidden or not, depending on 
    //the type of display mode. The output of a primary key is always visible.
    //The parent record carries the value to be displayed
    function display_value(page $page, mode $mode, driver_record $parent) {
        //
        //Display the output html tag
        $this->display_output_tag($page, $mode, $parent);
        //
        //Display the input html tag. The page is needed, e.g., for proper 
        //referencing the onclick input field of a foreign key relation
        $this->display_input_tag($page, $mode, $parent);
        //        
        //Display the metadata tags; the page is not needed for the dislay
        $this->display_metadata_tags($mode, $parent);
    }

    //An ordinary field has no metadata; so this does noting
    function display_metadata_tags(mode $mode, driver_record $parent) {
        
    }

}

//A mutall record can be used for driving page displays; it is associated with 
//values that relate to its fields. The Buis login page one of its extensiions
class driver_record extends driver {

    //
    //The values of a record -- stdClass object whose properties have a 
    //relationship withe the record's fields (and subfields)
    public $values;

    //
    //Notes about a record:-
    //- The table name of a record is optional; if not provided, the record 
    //  cannot be saved to a database, e.g., the case of logging in. This was the
    //  justification for doing away with record an extension of a "writeable" 
    //- The  reference table parameter was added so that access to the indices (needed
    //  for saving a record) is consistent for both sql and record
    //- The statement is partially tracking the sql from which the record was generated. When
    //  is this useful
    function __construct($fields, $dbase = null, $tname = null, $reftable = null, $sql = null, $values = null) {
        //
        $this->fields = $fields;
        $this->dbase = $dbase;
        $this->tname = $tname;
        $this->reftable = $reftable;
        $this->sql = $sql;
        $this->values = $values;
        //
        //Initialize the inherited page driver
        parent::__construct();
        ///
        //
         //Ensure that the fields point back to this driver to allow fields to 
        //access their parent driver. This is important in the case of e.g., 
        //a column y, needing to access its value as x.values[y.name] where
        //x is the parent record, i.e., x=y.parent 
        foreach ($fields as $field) {
            //
            //Let every field record point to its parent
            $field->parent = $this;
        }
    }

    //
    //Write, i.e., insert or update, this record to the current database.
    function write_data() {//record
        //
        //A write is valid for this record only if the table name is known AND AN 
        //IDENTIFICATION INDEX is available; else report an error. 
        if (!isset($this->tname) || !isset($this->reftable->indices)) {
            //
            throw new Exception("No table (or identification index) is found for the database write operation");
        }
        //
        //Determine if we need to insert new or update existing data; we update
        //if the primary key is found.
        //
        //Find the primary key
        if (isset($this->values->{driver_field::primary})) {
            //
            $primarykey = $this->values->{driver_field::primary};
            //
            //The key is not found if it is empty
            $found = ($primarykey === "") || is_null($primarykey) ? false : true;
        } else {
            $found = false;
        }
        //
        //Uupdate the record if teh primary key is found; otherwise insert a 
        //new record
        switch ($found) {
            //
            //Compile the UPDATE statement
            case true:
                //
                //Compile the update sql statement
                $sql = $this->compile_update_sql($primarykey);
                break;
            //    
            //Compile the INSERT statement; the record and sql insert statements 
            //have similar headers but different values section
            case false:
                //
                //Compile the insert values section; this depends on whether the
                //caller is a record or an sql
                $arr = $this->get_insert_values();
                //
                //Return the array keys as a list of comma separated values
                //demarcated with double backticks
                //
                //Get the array keys
                $keys = array_keys($arr);
                //
                //Backtick quote the keys
                $keys2 = array_map(function($key) {
                    return "`$key`";
                }, $keys);
                //
                //Convert the key to a comma separated list
                $fnames = implode(", ", $keys2);
                //
                //Return the values as a list of comma separated values demarcated
                //with single quotes
                //
                //Convert to a comma separated list. Remember that the values 
                //ara already quoted
                $values = implode(", ", $arr);
                //
                //Compile the insert header section
                $sql = "INSERT INTO `$this->tname` ($fnames) VALUES ($values)";
                //
                //Insert the body
                break;
        }
        //
        //
        //Get the current databse
        $dbase = $this->get_dbase();
        //
        //Execute the sql; report any error
        if (!$result = $dbase->conn->query($sql)) {
            die($sql . "<br/>" . $dbase->conn->error);
        }
    }
    
    //Returns true and binds the the primary key of this record if it is valid;
    //otherwise it returns false
    function try_primarykey_value(&$primarykey) {
        //Compile teh primary key
        if (isset($this->values->{driver_field::primary})) {
            //
            $primarykey = $this->values->{driver_field::primary};
            return true;
        } else {
            return false;
        }
    }

    //Returns an array of values to insert to a database, indexed by teh field 
    //name
    function get_insert_values() {
        //
        //Statring with an empty array....
        $arr = [];
        //
        //...collect the given records's values in a comma separated list
        foreach ($this->fields as $field) {
            //
            //Exclude fields that cannot be modified, e.g., primary keys and 
            //derived fields
            if ($field->is_modifiable()) {
                //
                //Only valid values are inserted to the database
                if ($field->try_writable_value($this->values, $xvalue)) {
                    //
                    //Add the leading comma and compile the header; the xvalue is
                    //already quote delimited if it is not null
                    $arr[$field->name] = $xvalue;
                }
            }
        }
        //
        //Return the data collection
        return $arr;
    }

    //Fill this record with the values resulting from executing this record's sql
    //statement with the given condition.
    function fill($condition) {
        //
        //Add the condition to the base sql to get the full sql
        $fullsql = "$this->sql WHERE $condition";
        //
        //Execute the sql statement to get a mysqli::result
        $result = $this->dbase->query($fullsql);
        //
        //Fetch the only row (as an object for for compatibilty with javascript
        //as JS deos not undertand PHP's index arrays)
        $values = $result->fetch_object();
        //
        //The values cannot be empty. Yes it can. But. T
        if (!$values) {
            //
            throw new Exception("Requested data with condition '$condition' not found");
        }
        //
        //Set the values property
        $this->values = $values;
        //
        //Fill the record field values as well
        foreach ($this->fields as $field) {
            //
            //Set the field value
            $field->set_value();
        }
        //
        //Release the buffer
        $result->free();
    }

    //Compile the update sql of this record using the given primary key
    function compile_update_sql($primarykey) {
        //
        //Compile the update header section of the statement
        $sql = "UPDATE `$this->tname` SET ";
        //
        //Set the leading comma separator to nothing; it will be updated later
        $comma = "";
        //
        //Compile the comma separated list of values to update
        foreach ($this->fields as $fname => $field) {
            //
            //Exclude fields that cannot be modified, e.g., primary key field and
            //derived fields
            if ($field->is_modifiable()) {
                //
                //Define a writable field value
                $xvalue = "";
                //
                //Only valid values are updated
                if ($field->try_writable_value($this->values, $xvalue)) {
                    //
                    //Add the leading comma and compile the header. The field's 
                    //value is already quote delimited or is null
                    $sql .= "$comma `$fname` = $xvalue";
                    //
                    //Update the comma separator
                    $comma = ", ";
                }
            }
        }
        //
        //Compile the write footer section
        $sql .= " WHERE `$this->tname` = $primarykey";
        //
        return $sql;
    }

    //Display a normal record by looping through all its fields and displaying 
    //each one of them in the requested style.
    function display_data(page $page, layout $layout, mode $mode, driver $sql = null) {//record
        //
        //Open the record tag name
        echo "<$layout->record_tag_name ";
        //
        //Display the record attributes; the parent sql carries data on the 
        //identification index of the sql.
        $this->display_record_attributes($page, $sql);
        //
        //Close the recrod attributes
        echo ">";
        //
        //Add the checkbox cell for every entry to support selection of
        //records for e.g., merging purposes. It's id is simply the name
        //'check' and on click it should gravitate current row to the top
        echo "<$layout->field_tag_name";
        //
        //Show the checkbox if needed; by default it is shown.
        $page->hide_check_box();
        //
        echo ">";
        //
        //On clicking the check box, call the gravitate function associated 
        //with the javascript expression of the given page
        echo " <input type='checkbox' id='check' onclick='$page->jsxp.gravitate(this);'/>";
        //
        //Close the checkbox field tag
        echo "</$layout->field_tag_name>";
        //
        //Display the content; that depnds on the page
        $page->display_record($this, $layout, $mode);
        //
        //Close the record tag name
        echo "</$layout->record_tag_name>";
    }

    //Display thh attributes of a this record
    function display_record_attributes(page $page, driver_sql $parent = null) {
        //
        //Set the id of table row -- that depends on whether the page's index
        //is defiend or not. The index is the name of the field that supplies 
        //data to the id attribute of the recprd
        //The id attrubute is needed for hreferencing purposes.
        if (isset($page->index)) {
            //
            //Get the name of the index field
            $fname = $page->index;
            //
            //The id attribute of any table record, which must be provided, is 
            //needed for hreferencing the tr. The name of the property that
            //houses the name of the id is this.index
            if (isset($this->values->$fname)) {
                echo " id='" . $this->values->$fname . "'";
            }
        }
        //
        //The on-click event should evoke the record selection base on the
        //javsecript expression of the given page
        echo " onclick='" . $page->jsxp . ".select_dom_record(this)'";
        //
        //Set the primary key -- if it is available
        if (isset($this->values->{driver_field::primary})) {
            echo " primarykey='" . $this->values->{driver_field::primary} . "'";
        }
    }

}

//The xml driver is teh source of data for the home page of a website
class driver_xml extends driver {
    //
    //The full path of teh xml file. (Impornatn for saving back the xml document)
    public $file;
    //
    //The xml document of this driver
    public $xml;
    //
    //The dbase oif this driver
    public $dbase;

    //
    //Initialize the inherited page driver
    function __construct($xml_document, $dbname) {
        //
        //Save the xml source file
        $this->file = $xml_document;
        //
        // Load the XML source tghat drives this page
        // 
        //Create a new xml document
        $this->xml = new DOMDocument;
        //
        //Load the source file and test for errors
        $this->xml->load($xml_document);
        //
        //Set the database driving this page
        $this->dbase = new dbase(page_login::password, page_login::username, $dbname);
        //
        //Construct the oarent druver
        parent::__construct();
    }

    //An xml document has no parent
    function display_data(page $page, layout $layout, mode $mode, driver $parent = null) {//xml
        //
        //Load the identity translation style sheet
        $xsl = new DOMDocument;
        $xsl->load('../library/identity.xsl');
        //
        // Configure the transformer
        $proc = new XSLTProcessor;
        $proc->importStyleSheet($xsl); // attach the xsl rules
        //
        //Do the transform. Is there any status code?
        $result = $proc->transformToDoc($this->xml);
        //
        //Save to a text string
        $txt = $result->saveHTML();
        //
        //Echo the result
        echo $txt;
    }

    //Write the data represented by this page driver to the database. 
    //(write_data() is easier to search than just write())
    function write_data() {
        throw new Exception("Wite xml not implemented yet");
    }

}

//The root sql is special in that:-
//- it is the parent ancestor of all mutall sqls
//- It sets the string version of an sql object
//- It implements the getters and setters of all protected properties in the
//  inheritance chain
//- It can drive a page, just like a record
class driver_sql extends driver {

    //
    //The database from which this sql is derived is protected as we dont need a 
    //json version of it. We use the get and accessors access it.
    //(Why was I forced to make this public?)
    public $dbase;
    //
    //The joins that constitute the From clause of an sql statement. Their use
    //expires once the sql statement is constructed, so they dont need jsoning
    protected $joins = [];
    //
    //The where clause as a boolean expression for the driving the sql 
    //statement
    public $where;
    //
    //The sql statement associated with this driver. If not provided, it is 
    //compiled from the joins and where calueses of this sql.
    public $sql;

    //
    //The Mutall sql object models the sql statement. If the statement is given 
    //directly, we use it as it is; otherwise we derive derived it using the sql 
    //data initializer that is specific to the sql. If the fields are given, we
    //respect them; ojerwise we derived them from the statement.
    function __construct(dbase $dbase, $sql = null, $fields = null) {
        //
        $this->dbase = $dbase;
        //
        $this->sql = $sql;
        //
        $this->fields = $fields;
        //
        //Initialize the inherited page driver
        parent::__construct();
        //
        //Set the properties of this sql, i.e., fields and joins
        $this->initialize_sql_data();
    }

    //Returns true if this sql yields no data
    function is_empty() {
        //
        //Execute the sql
        $results = $this->query();
        //
        //Fetch teh first record
        $result = $results->fetch_assoc();
        //
        $is_empty = $result ? false : true;
        //
        //Close the result
        $results->close();
        //
        return $is_empty;
    }

    //Write the data generated by this sql to a database. Not just any sql can 
    //be written to a database, only those derived that extends sql_table, e.g.,
    //sql_edit.
    //This functionality is not implemented for this version. When it will, it
    //allow saving of multiple records to a database, all sharing the same 
    //header. Binding of values to parameters will be a plausible. This version
    //wiill need get_writeble_data(), as opposed to the try_writable_data 
    //option used by the record class
    function write_data() {//sql
        //
        throw new Exception("Writing sql data to a database is not yet implementsd");
    }

    //The default initialization of an sql is needed only if the fields of this
    //sql are not given
    function initialize_sql_data() {//sql
        //
        //Building of fields is not necessary if the fields are already
        //defined
        if (isset($this->fields) && !is_null($this->fields)) {
            //
            return;
        }
        //
        //Derive the fields from this sql's statement
        //
        //We assume that the statement must be set
        //
        //Execute this query 
        $query = $this->query();
        //
        //Retrieve the columns. The resullyig array is not indexed
        $fields = $query->fetch_fields();
        //
        //Initialize this sql's fields
        foreach ($fields as $field) {
            /*
              Indexes of the fetched field
              name	The name of the column
              orgname	Original column name if an alias was specified
              table	The name of the table this field belongs to (if not calculated)
              orgtable	Original table name if an alias was specified
              max_length	The maximum width of the field for the result set.
              length	The width of the field, in bytes, as specified in the table definition. Note that this number (bytes) might differ from your table definition value (characters), depending on the character set you use. For example, the character set utf8 has 3 bytes per character, so varchar(10) will return a length of 30 for utf8 (10*3), but return 10 for latin1 (10*1).
              charsetnr	The character set number (id) for the field.
              flags	An integer representing the bit-flags for the field.
              type	The data type used for this field
              decimals	The number of decimals used (for integer fields) */
            //
            //Create a new column from the given standard field of a fetched 
            //record, leaving out the optional fields
            $col = new column(
                    //
                    //Use the oroginal table of as the tname
                    $field->orgtable,
                    //
                    $field->name,
                    //
                    //Pass the restof the field
                    $field);
            //
            //Set this query's fields indexed by the field name
            $this->fields[$field->name] = $col;
        }
    }

    //Display the Sql (driver data) using the given style. An sql has no parent driver.
    //In contrast, the parent of a record is an sql and that of a field is a record
    function display_data(page $page, layout $layout, mode $mode, driver $parent = null) {//sql
        //
        //Output the header tags if they are needed; they are not needed if we
        //are displaying data to extend (rowwise) an existing table, e.g., when 
        //implementing the scrolling function 
        if (!$page->body_only) {
            //
            //Output the envelop tag; this is to consistency between tabular and
            //label layout. The specific tag for a table is 'table'; that of a
            //label is 'envelop'
            echo "<$layout->envelop_tag_name>";
            //
            //Output the open body tag, e.g., 'tbody' for the tabular layout or 
            //'records' for label
            echo "<$layout->body_tag_name>";
            //
            //Display a header; that depends on the layout. Labeled pages
            //dont have a header. Consider doing away with layout as an object
            //in favvor of layout_type -- which a simple data type that is easily
            //shared with the client. This means paraphrasing this instruction 
            //to:
            $page->display_layout_header($this, $layout);
        }
        //
        //Create a new record that shares the same reference table name as this Sql. 
        //The (optional) values are left out, until we execute the sql and start stepping
        //through it to fill them.
        $record = new driver_record($this->fields, $this->dbase);
        //
        //Impose further conditions, e.g., filtering, defined on this page 
        //before executing the statement of this sql to get a result. Pass the 
        //caller page (of  conditions).
        $result = $this->query($page);
        //
        //Fetch each row as a php record constructed using the given parameters
        while ($values = $result->fetch_object()) {
            //
            //Now set the record's values
            $record->values = $values;
            //
            //Display the record in the requested layout and mode. The parent
            //of the record is this sql
            $record->display_data($page, $layout, $mode, $this);
        }
        //Close the result
        $result->free();
        //
        //Display the page footer, e.g., invoice statement totals
        $page->display_footer();
        //
        //Output the closing header tags -- if they are needed. See the comment
        //above
        if (!$page->body_only) {
            //
            //Output the close body tag, e.g., tbody for tabular layouts
            echo "</$layout->body_tag_name>";
            //
            //Close the body
            echo "</$layout->envelop_tag_name>";
        }
    }

    //Retuns the fields to be used for retrieving data for this sql. For ordinary
    //sqls, these are the normal fields. For sql edit these are the basic fields
    function data_fields() {//sql
        //
        return $this->fields;
    }

    //Derive the sql statement from this sql's clause componnets
    function derive_sql() {
        //
        //We assume that the fields of this sql are all basic fields. Preppare
        //to cllect sql expressions for the fields -- the xvalues.
        $xvalues = [];
        //
        //Retuns the fields to be used for retrieving data for this sql. For 
        //ordinary sqls, these are the normal fields. For sql_edit these are the 
        //basic fields
        $fields = $this->data_fields();
        //
        //Compile the fields' value expressions
        foreach ($fields as $key => $field) {
            //
            //Get the alias; there is no alias if a field does not have a name
            $alias = $field->alias();
            //
            //Having lots of problems with this. What problems? That field->xvalue 
            //is not casting to a string by executing the magic functiion, so I 
            //had to do it explicitly
            $xvalue = $field->xvalue->__toString();
            //
            $xvalues[$key] = $xvalue . $alias;
        }
        //
        //Convert the list of aliased field expressions into a comma separated 
        //list of strings
        $a = implode(", ", $xvalues);
        //
        //Let $b be the required join expression
        //
        //Starting with the reference table name, formulate a join expression 
        $b = "`$this->tname`";
        //
        //Walk through the joins to compile the desired From clause
        foreach ($this->joins as $join) {
            $b = "(" . $b . (string) $join . ")";
        }
        //Let $c be where clause. (THIS IS NOT CONSISTENT WITH THE FACT THAT 
        //WE OFTEN ADD THE WHERE CLAUSE TO STATEMENT AT RUNTIME)
        $c = isset($this->where) ? " WHERE " . $this->where : "";
        //
        //Compile the full statement, including the select condition
        return "SELECT $a FROM $b $c";
    }

    //Define the getter and setter functions for this sql's protected properties
    function __get($prop) {
        return $this->$prop;
    }

    function __set($prop, $value) {
        $this->$prop = $value;
    }

    //To update the protected joins, the getter and setter is not enough. Hence
    //this simple function
    function update_joins($which, $join) {
        $this->joins[$which] = $join;
    }

    //Query this sql (on the given page) to get a result. The page imposes
    //further conditions and limits on the data that is returned by this sql
    function query(page $page = null) {
        //
        //Compile the full sql statement
        //
        //Get the base sql statement, i.e, without any conditions.
        $base = $this->sql;
        //
        //Get the where clause if provided by the page querystring
        $where = empty($page->arr['criteria']) ? "" : " WHERE " . $page->arr['criteria'];
        //
        //Add the order by clause
        $order_by = empty($page->arr['order_by']) ? "" : " ORDER BY " . $page->arr['order_by'];
        //
        //Set the page limit and offset
        //
        //By default, there is no page limit
        $limit = "";
        //
        //A limit is valid if specified and not overriden
        if (isset($page->limit) && !$page->no_limit()) {
            //
            //Define the offset if it is specified
            $offset = isset($page->offset) ? " OFFSET $page->offset" : "";
            //
            //Define the full limit statement
            $limit = " LIMIT $page->limit$offset";
        }
        //
        //Save the full statement of a page (without limits) for further re-use
        $sql = "$base $where $order_by $limit";
        //
        //Execute the sql statement (with page limits) to get a mysqli::result; 
        //this throws an exception if there is a problem with the query
        $result = $this->dbase->query($sql);
        //
        //Return the result
        return $result;
    }

    //The string version of any sql object is its sql statement it is set;
    //otherwise derive it from the separate clauses
    function __toString() {
        return isset($this->sql) ? $this->sql : $this->derive_sql();
    }

}
