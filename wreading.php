<?php
//
//View the water readings in support of consumption monitoring
//
//Access the services library which in tuen accesses the buis and mutall versions
require_once "mutall_rental.php";
//
//Create an instance of a water readings
$wreading= new wreading();
//
?>
<html>

    <head>
        <title>Records></title>
        
        <!-- Make the page phone sensitive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       
        <link id="mutallcss" rel="stylesheet" type="text/css" href="../library/mutall.css">

        <!-- Script for referencing the prototypes for objects needed for 
        interacting with this page -->
        <script id='mutalljs' src="../library/library.js"></script>

        <script id='wreading' src="mutall_rental.js"></script>

        <!--Script for defining the objects needed for interacting with this page-->
        <script id='page'>
            //
            //Create an active js page of records around which the related methods 
            //will be organized.
            var wreading = new wreading(<?php echo $wreading; ?>);
            //
        </script>

    </head>
    <body onload="wreading.onload()">

        <!-- The header section -->
        <header>
            <!-- The data for composing the where of an sql-->
            <div>
                <label for ="criteria">Search Criteria</label>
                <input 
                    type ="text" 
                    id="criteria" 
                    size="80" 
                    <?php echo $wreading->get_qstring_value('criteria'); ?>
                    onchange='wreading.onchange(this)'/>
            </div>
            <div>
                <label for ="order_by">Order by</label>
                <input 
                    type ='text' 
                    id='order_by'
                    <?php echo $wreading->get_qstring_value('order_by'); ?>
                    onchange='wreading.onchange(this)'/>
            </div>
            <div>
                <!--Hiding undesired fields -->
                <label for ="hidden_fields">Hidden Fields</label>
                <input 
                    type ="text" 
                    id="hidden_fields"
                    <?php echo $wreading->get_qstring_value('hidden_fields'); ?>
                    onchange='wreading.onchange(this)'/>
            </div>
            
            <!-- Selector group-->
            <div id="gselector">
                <label for='selector'>Show Multi-Record Selector</label>
                <input 
                    type='checkbox' 
                    id='selector' 
                    <?php echo $wreading->get_qstring_value("selector", true);?>
                    onchange='wreading.onchange(this)'/>
            </div>

        </header>

        <!-- Capture  the onscroll event (vertical) for this articles node -->
        <article onscroll = "wreading.vscroll(this)">

            <?php
            //
            //Display this page using the local settings, i.e.,layout and mode, 
            // defined during construction
            $wreading->display_page();
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
                onclick="wreading.search_criteria()" />
            
            <!-- Save teh query used for construction thos page to the jonb 
            table
            -->
            <!-- Add a new record-->
            <button id=add_record type="button">
                <a 
                    href="wreading_record.php?dbname=mutallco_rental"> 
                    Add New Records
                </a>
            </button>

            <!-- Modify the current record-->
            <input 
                id=edit_record 
                type="button" 
                value="Modify record" 
                onclick='wreading.edit_record()'>

            
            <input 
                id=delete_record 
                type="button" 
                value="Delete record" 
                onclick="wreading.delete_record()">   
            
            <!-- This tag is needed for reporting mutall errors. On clicking
            clear the error--> 
            <p id='error' onclick='this.innerHTML=""'></p>

        </footer>

    </body>

</html>
