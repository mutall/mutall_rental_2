<?php
//
//View the current water charges. 
//
//Access the mutall_tenyal library which in turn accesses the and mutall version
require_once "mutall_rental.php";
//
try{
    $ebill= new ebill();
//
?>
<html>

    <head>
        <title>Records></title>
        
        <!-- Make the page phone sensitive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       
        <link id="mutall.css" rel="stylesheet" type="text/css" href="../library/mutall.css">

        <!-- Script for referencing the prototypes for objects needed for 
        interacting with this page -->
        <script id='mutall.js' src="../library/mutall.js"></script>

        <script id='ebill' src="mutall_rental.js"></script>

        <!--Script for defining the objects needed for interacting with this page-->
        <script id='page'>
            //
            //Create an active js page of records around which the related methods 
            //will be organized.
            var ebill = new ebill(<?php echo $ebill; ?>);
            //
        </script>
        <style>
            footer {
                height:0%;
                background-color: greenyellow;
                    }
            
            article
            {
                height:85%;
                background-color:aliceblue;
                overflow:scroll; 
            }
            button{
                float: left;
                size: 20px;
            }
        </style>

    </head>
    <body onload="ebill.onload()">

        <!-- The header section -->
        <header>
            <!-- This tag is needed for reporting mutall errors. On clicking
            clear the error--> 
            <p id='error' onclick='this.innerHTML=""'></p>
            
            <!-- The data for composing the where of an sql-->
            <div>
                <label for ="criteria">Search Criteria</label>
                <input 
                    type ="text" 
                    id="criteria" 
                    size="80" 
                    <?php echo $ebill->get_qstring_value('criteria'); ?>
                    onchange='ebill.onchange(this)'/>
            </div>
            <div>
                <label for ="order_by">Order by</label>
                <input 
                    type ='text' 
                    id='order_by'
                    <?php echo $ebill->get_qstring_value('order_by'); ?>
                    onchange='ebill.onchange(this)'/>
            </div>
            <div>
                <!--Hiding undesired fields -->
                <label for ="hidden_fields">Hidden Fields</label>
                <input 
                    type ="text" 
                    id="hidden_fields"
                    <?php echo $ebill->get_qstring_value('hidden_fields'); ?>
                    onchange='ebill.onchange(this)'/>
            </div>
            
            <!-- Selector group-->
            <div id="gselector">
                <label for='selector'>Show Multi-Record Selector</label>
                <input 
                    type='checkbox' 
                    id='selector' 
                    <?php echo $ebill->get_qstring_value("selector", true);?>
                    onchange='ebill.onchange(this)'/>
            </div>
            
            
            <input 
                type ="button" 
                id="email" 
                value='Send to Email ' 
                onclick="ebill.email_lovinah_report()" />

        </header>

        <!-- Capture  the onscroll event (vertical) for this articles node -->
        <article onscroll = "ebill.vscroll(this)">

             <?php
            //
            //Display this page using the local settings, i.e.,layout and mode, 
            // defined during construction
                $ebill->display_lovinah_report();
            ?>
        </article>

    </body>

</html>
<?php
}
catch(Exception $ex){
    $mutall = new mutall();
    echo $mutall->get_error($ex);
    //echo $ex->getMessage();
}