<?php
namespace invoice;
//
    //The page class, needed to lauch the index() function below, is defined in 
    //the following shared library. Note how it is placed relative to this project
    require_once "../library/invoice/classes.php";
    //
    //The index will will evoke methods, some of which are in the shared library, 
    //others are locally defined in this project. To the resolve locally defined 
    //ones, we need access to the local classes.
    require_once "model/invoice/classes.php";
    //
    //Now call the index process from the invoice namespace. Pass the home 
    //directory to the page
    $normal = new poster_mutall(2019, 4);
    
?>
<html>
    <head>
        
        <!--Keep title short and unique, so that this page can be identified
        even when there are many open cases-->
        <title>Normal Print Invoice</title>
        
        <link id="invoice.css" rel="stylesheet" type="text/css" href='invoice.css'>

    </head>
    
    <body>
        <?php
        //
        //Display the invoice page in a detailed fashion
        $normal->display('layout_mutall', 'detailed', 'false');
        ?>
       
    </body>
</html>
