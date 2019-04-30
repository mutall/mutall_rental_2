<?php
//
//View the records of some table in a desired style
//
//The page_ecords class used to drive this page is defiend in the extended 
//library that supporta a broda set of useres o interact with this page 
require_once "mutall_rental.php";
//
//Create an instance of this page of records and assume that all the 
//required inputs have been supplied via a query string. This allows us to 
//incorporate this page in a website
$qstring = new querystring();
$eaccount= new eaccount($qstring);

//
?>
<html>

    <head>
        <title>Records></title>

        <link id="mutallcss" rel="stylesheet" type="text/css" href="../library/mutall.css">

        <!-- Script for referencing the prototypes for objects needed for 
        interacting with this page -->
        <script id='mutalljs' src="../library/mutall.js"></script>

        <script id='eaccount' src="mutall_rental.js"></script>

        <!--Script for defining the objects needed for interacting with this page-->
        <script id='page'>
            //
            //Create an active js page of records around which the related methods 
            //will be organized.
            var eaccount = new eaccount(<?php echo $eaccount; ?>);
            //
        </script>

    </head>
    <body onload="eaccount.onload()">

        <!-- The header section -->
        <header>
            <!-- The data for composing the where of an sql-->
            <div>
                <label for ="criteria">Search Criteria</label>
                <input 
                    type ="text" 
                    id="criteria" 
                    size="80" 
                    <?php echo $eaccount->get_qstring_value('criteria'); ?>
                    onchange='eaccount.onchange(this)'/>
            </div>
            <div>
                <label for ="order_by">Order by</label>
                <input 
                    type ='text' 
                    id='order_by'
                    <?php echo $eaccount->get_qstring_value('order_by'); ?>
                    onchange='eaccount.onchange(this)'/>
            </div>
            <div>
                <!--Hiding undesired fields -->
                <label for ="hidden_fields">Hidden Fields</label>
                <input 
                    type ="text" 
                    id="hidden_fields"
                    <?php echo $eaccount->get_qstring_value('hidden_fields'); ?>
                    onchange='eaccount.onchange(this)'/>
            </div>
            
            <!-- Selector group-->
            <div id="gselector">
                <label for='selector'>Show Multi-Record Selector</label>
                <input 
                    type='checkbox' 
                    id='selector' 
                    <?php echo $eaccount->get_qstring_value("selector", true);?>
                    onchange='eaccount.onchange(this)'/>
            </div>

        </header>

        <!-- Capture  the onscroll event (vertical) for this articles node -->
        <article onscroll = "eaccount.vscroll(this)">

            <?php
            //
            //Display this page using the local settings, i.e.,layout and mode, 
            // defined during construction
            $eaccount->display_page();
            ?>
            
            
        </article>

        <!-- The footer section -->
        <footer>
            <!--
            Execute the a search on hitting the enter key. The searched 
            value will be read off the criteria input field -->
            <input 
                type ="button" 
                id="search" 
                value='Refresh' 
                onclick="eaccount.search_criteria()" />
            
            <!-- Save teh query used for construction thos page to the jonb 
            table
            -->
            <input 
                type ="button" 
                id="sms" 
                value='Save to Job' 
                onclick="eaccount.save_2_job()" />
            
            <!-- This tag is needed for reporting mutall errors. On clicking
            clear the error--> 
            <p id='error' onclick='this.innerHTML=""'></p>

        </footer>

    </body>

</html>
