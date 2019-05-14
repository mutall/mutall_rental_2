<?php
//Start a session and avail the Broad User Interactive System libray 
//including the core mutall libray, the buis web pages, the common servives 
//and the code sspecific to this page
require_once "mutall_rental.php";
//
//Create an instance of this page
$mutall_rental= new mutall_rental();
?>
<html>
    <head>
        <title>mutall_rental</title>
        
        <!-- Make the page phone sensitive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       
        <!-- Style sheet shared by all mutall pages -->
        <!--link id="mutall.css" rel="stylesheet" type="text/css" href='../library/mutall.css'/-->

        <!-- Style sheet specific to this page -->
        <link id="rental.css" rel="stylesheet" type="text/css" href="mutall_rental.css"/>

        <!-- Javs scripts for the Core Mutall library -->
        <script id='mutall.js' src='../library/mutall.js'></script>
        
        <!--Javascripts specific to this website-->
        <script id='rental.js' src='mutall_rental.js'></script>

       <!--Script for interfacing Js with PHP objects-->
        <script id='js.php.interface'>
            //Create a js page_buis object. (Note how echoing a mutall object
            //produces a checked json string)
            var mutall_rental = new mutall_rental(<?php echo $mutall_rental;?>);
            //
            //Debug
            //console.log(mutall_rental);
        </script>

    </head>
    <!-- Initialize the page , starting with the login status -->    
    <body onload="mutall_rental.onload()">

        <!-- The header section -->
        <header>
            <!-- Display the site logo -->
            <logo>
                <img src="pictures/logo.png" alt="" />
            </logo>
         <!---Display the register and login buttons--->
            <account>
                <input type="button" value="Sign in" id="login" onclick='mutall_rental.log(true)'/>
                <input type="button" value="Sign out" hidden='true' id="logout" onclick='mutall_rental.log(false)'/>
                <br/>
                <input type="button" value="Register" id="register" onclick='mutall_rental.register()'/>
                <a href="/buisv2.4"></a> 
            </account>
            
            <!---Display the available services-->
            <services>
                <?php
                $mutall_rental->display_services();
                ?>
            </services>
           <!-- Display the definers. -->
            <definers>
               <?php
                $mutall_rental->display_definers();
                ?>
            </definers>
        </header>
        
        
        <!-- The articles section. -->
        <article >
            <?php
                $mutall_rental->display_page();
                ?>
        </article>
        <script>
            var page_home = new page_home();
        </script>
    </body>

</html>
    