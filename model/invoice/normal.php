<?php
//
//View the invoice reports to be printed on a normally, i.e., on A4 paper
//using a color printer
//
//The page class, needed to lauch the index() function below, is defined in a 
//shared library.
//Presently teh shared library is in
$library = "mutall_rental";
//
//The index will will evoke methods, some of which are in the shared library, 
//others are locally defined in this project. To the resolve locally defiend 
//ones, we need the name of the ocal folder and its matching local file
$local = "mutall";
//
//Include the libray
require_once "../$library/mutall.php";
//
//include teh loacl file
require_once "../$local/$local.php";
//
//Create the nomal print invoice
$normal = new normal_mutall();
?>
<html>
    <head>
        
        <!--Keep title short and unique, so that this page can be identified
        even when there are many open cases-->
        <title>Normal Print Invoice</title>
        
        <link id="mutall.css" rel="stylesheet" type="text/css" href='<?php echo "../$library/mutall.css";?>'>

        <link id="mutall_rental.css" rel="stylesheet" type="text/css" href="mutall_rental.css">

        <!-- Scripts available from the shared library-->
        <!--script id='mutall.js' src="mutall.js"></script-->

        <!--Scripts that are local to this project-->
        <script id='mutall_rental.js' src="mutall_rental.js"></script>
        
        <!--Script for defining the objects needed for interacting with this page-->
        <script id='page'>
            //
            //Create the normal js report from the php version
            //var normal = new report_normal(<?php //echo $normal; ?>);
        </script>
    </head>
    
    <body>
        <!-- The non-scrolling part of this page contains the:- 
        - input area for specifying report criteria-->
        <header>
            <!-- Specify the where clause of criteria-->
            <label>Search Criteria
                <input 
                    type ="text" 
                    size="80" 
                    id='criteria'
                    <?php 
                    echo isset($normal->criteria) ? $normal->criteria: ""; 
                    ?>
                />
           </label> 
            
            <!-- Specify the sorting order clause for the report-->
            <label>Order by
                <input 
                    type ='text' 
                    id='order_by'
                    <?php 
                    echo isset($normal->order_by) ? $normal->order_by: "";
                    ?>
                />    
           </label>
          
            <!-- Initiate a new search using teh criteria and ordering clauses-->
            <button onclick = 'normal.search(this)'/>
                Search
            </button>
            
        </header>
        
        <!-- Capture  the vertical and horizontal scrolls for managing the 
        synchronisation of the report's top, left and body panes-->
        <article onscroll = "normal.scroll(this)">
              
        <?php
            //Display the invoice page
            $normal->display()
        ?>
        </article>
    </body>
</html>
