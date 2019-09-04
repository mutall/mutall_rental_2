<?php
namespace invoice;

//Item classes specific to this model's invoice subsystem
require_once "model/invoice/items/electricity.php";
require_once "model/invoice/items/rent.php";
require_once "model/invoice/items/water.php";

//Modelling mutall_rental_database on the local server
class dbase_local_mutall_rental extends dbase {

    //
    public function __construct() {
        //
        $username = "root";
        $password = "";
        //
        //Use the latest version 
        $dbname = "mutallco_rental";
        //
        parent::__construct($username, $password, $dbname);
    }

}

//A mutall poster
class report_mutall extends report{
    //
    //
    public function __construct() {
        //
        //Construct the parent.
        parent::__construct();
        }
    
    //The databse used by mutall project
    function get_dbase() {
        //
        return new dbase_local_mutall_rental();
    }
    
    //Returns the mutall record
    function get_record(){
        return new record_mutall($this);
    }
    
    
}

//A mutall poster
class poster_mutall extends poster{
    //
    //
    public function __construct() {
        //
        //Construct the parent.
        parent::__construct();
        //
        //Add the cc's to teh emailer. This is where customization of an emailer 
        //takes place
        $this->emailer->AddCC('osoro.wycliff@gmail.com');
        $this->emailer->AddCC('phyllis.pn@gmail.com');
        //$this->AddCC('atienovivian35@gmail.com');
    }
    
    //The databse used by mutall project
    function get_dbase() {
        //
        return new dbase_local_mutall_rental();
    }
    
    //Returns the mutall record
    function get_record(){
        return new record_mutall($this);
    }
    
    //
    //Testbed for sql's
    function test(layout $layout=null, $level=null, $monitor=null) {//poster
        //
        //Initialize this invoice with data from multiple sources, including the
        //given arguments
        $this->initialize($layout, $level, $monitor);
        //
        //Get the sql to test
        $sql = $this->record->items['electricity']->power();
        //
        //Display it
        $this->display_sql($sql);
    }
    
}

//Model a invoice report to be printed a normally, i.e., on A4 paper
//using a color printer implying heavy use of CSS.
class layout_mutall extends layout_label {
    //
    function __construct() {
        parent::__construct();
    }
    
    //Show this underlying rcords data in on all the 5 sections of a labeled report
    function display_record() {
        //
        //Show the logo will all its supporting labels
        $this->show_record_logo();
        //
        //Use the invoice item to display the identification section of the
        //report
        echo "<section>";
        //
        //Let $ds be the detailed statement of an invoice item
        $ds = $this->record->items['invoice']->statements['detailed'];
        //
        //Let $ll be the a label layout
        $ll = new layout_label();
        //
        //Display the invoice detailed in a label layout
        $ll->display_statement($ds);
        echo "</section>";
        //
        //Use all the remaining items to show the report summary debit/credit
        //table, including teh closing balance with its double lines.
        $this->show_record_summary();
        //
        //Use all the remaining items to show the report details of each
        //item laid out in a label format, where only one record is involed,
        $this->show_record_detailed();
        //
        //Show the announcements, i.e., notes
        $this->show_record_announcements();
    }
    
    //Show the company logo and address.
    function show_record_logo(){
        //
        //Output the Logo image plus associated text
        echo 
        "<section id='logo'>"
            . "<img "
                . "src='logo.jpg'"
                . "style='width:150px; height:100px'"
                . "/>"
            . "Mutall Investment Co. Ltd. <br/>"
            . "P.O. Box 374<br/>"
            . "Kiserian - 00206 <br/>"
            . "email: mutallcompany@gmail.com<br/>"
            . "contact:Wycliffe on 0727 203 769<br/><br/>"
            .date("jS M Y"). "<br/>"
        ."</section>";
        //
        //Report the invoice reference number as the combination of the client
        ///id, invoice period year and month 
        echo 
        "<div>"
        . "INVOICE NO.: {$this->record->get_ref()}</p>"
        . "</div>";
        
    }
    
    //Use all the items of a record, other than invoice, to show the report 
    //details of each item laid out in a label format, where only one record 
    //is involed,
    function show_record_summary() {
        //
        echo "<section>";
        echo "<p class='name'>Summary</p>";
        //
        //Print a table tag.
        echo "<table>";
        //
        //Step through all the items of a record and display each one of them.
        foreach ($this->record->items as $key => $item) {
            //
            //Exclude the invoice.
            if ($key !== 'invoice') {
                //
                //Get teh summary data from the item and show in the label forma.
                $this->show_record_summary_item($item);
            }
        }
        //
        //Close the table.
        echo "</table>";
        echo "</section>";
        //
    }
    
    //Display the summary data of the given item in a tabular layout
    function show_record_summary_item(item $item) {
        //
        //Condition for displaying a summary arecord are:-
        //a) the summary must exist
        //b) the amount is not null
        $valid = (count($item->statements['summary']->results)>0) 
            && (!is_null($item->statements['summary']->results[0][0]));  
        //
        //Only cases with data will be shown
        if ($valid){
            //
            //Get the data
            //
            //Let $x be the amount to display. Only one result is expected
            $x =  $item->statements['summary']->results[0][0];
            //
            //Add a sign to it to $x
            //$signed = $item->is_credit ? invoice::credit * $x : invoice::debit*$x;
            //
            //Format it as an amount, i/r., no decimal and a thousand separator.
            $amount = number_format($x);   
            //
            //Show the data
            //
            echo "<tr name='$item->name'>";
            //
            //Now show the data
            echo "<td>";
                echo $item->title;
            echo "</td>";
            //
            //The values should be right aligned
            echo "<td class='double'>";
                //
                //Format the amount to currency
                echo $amount;
            echo "</td>";
            //
            //Close tr.
            echo "</tr>";
        }
    }

    //Use all the remaining items to show the report details of each
    //item laid out in a label format, where only one record is involed,
    function show_record_detailed() {
        //
        echo "<section>";
        //
        echo "<p class='name'>Details</p>";
        //
        //Step through all the items of a record and display each one of them.
        foreach ($this->record->items as $key => $item) {
           //
            //Exclude the invoice.
            if ($key !== 'invoice') {
                
                //
                //Show the item's data -- depnding on the number of records and
                //fields
                $item->display($this); 
            }
        }
        echo "</section detailed>";
        
    }
    
    //Show announcements on a record; that depends on the source of the normal report
    function show_record_announcements(){
        //
        //We assume that the the open_record($record) funstion is called before
        //making reference to $this->record
        //
        //First, test if here is posted data; if none return
        if (!isset($this->record->items['rent']->statements['detailed']->results[0])){
           return;     
        }
        //
        //Output the announcements
        //
        echo "<section>";
        //
        //Let $r be the rental value of the earliest agreement
        $r = $this->record->items['rent']->statements['detailed']->results[0]['price'];
        //
        //Let $a be the arrears
        $a = $this->record->get_arrears();
        //
        //Let $f be 1 for monthly and 3 for quaterly clients
        $f = $this->record->result['quarterly'] ? 3: 1;
        //
        //Let x be the no. of rental amounts in the opening balance, taking $f
        //into account 
        $x = $a/($r * $f);
        //
        //An upto-date acccount; thanks
        if ($a<=0){
            echo
            "<p class='ok'>"
            . "This account is very upto-date. Thank you."
            . "</p>";
        }
        //A well maintained account with a little balance
        elseif ($x<1){
            echo 
            "<p class='ok'>"
            . "This account is well maintained. Please clear the outstanding balance to make it perfect."
            . "</p>";
        }
        //
        //Arrears less that 2 months old
        elseif ($x>=1 and $x<2){
            echo
            "<p class='warning'>"
            . "This account is ok, but you have arrears that is more than your rental amount. Please clear the outstanding balance."
            . "</p>";
        }
        //
        //Arrears more than 2 months old is distressful
        else{
            //Format the x
            $fx = number_format($a/$r);
            //
            //This is a distress situation
            echo 
            "<p class='distress'>"
            . "Your account is in arrears of Ksh "
            . number_format($a)
            . " which is close to $fx times the rental amount of Ksh $r. "
            . "Please regularise it."
            . "</p>";
        }
        //
        //Get the client code for announcement purposes
        $code = $this->record->items['invoice']->statements['detailed']->results['0']['id'];
        //
        echo 
        "Make all cheques payable to Mutall Investments Co. Ltd<br/>"
        . "<br/>"
        . "Coop Bank-Kiserian<br/>"
        . "A/c No: 011 485 839 41800<br/>"
        . "OR<br/>"
        . "Kenya Commercial Bank-Kiserian<br/>"
        . "A/c No: 111 971 8260<br/>"
        . "<br/>"
        . "Please indicate your client code, <strong>$code</strong>, as the reference on "
                . "the banking slip<br/>";
        
        echo "</section>";
        
    }
    
}


//Modelling an invoice record
class record_mutall extends record{
    //
    function __construct(invoice $invoice){
        //
        //Call the parent constructor, passing this mutall record
        parent::__construct($invoice);
    }
    
    //Set the user defined items for mutall rental. 
    function get_udf_items(){
        //
        return [ 
            'rent' => new item_rent($this),
            'water' => new item_water($this),
            'electricity' => new item_electricity($this)
        ];
    }                

}


