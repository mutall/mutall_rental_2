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
        <link id="mutall.css" rel="stylesheet" type="text/css" href='../library/mutall.css'/>

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
            <h1>mutall_rental</h1>
        </header>
        
        <nav >
            Services Available via Customised Websites
            <services >
                <?php
                $mutall_rental->display_services();
                ?>
                
            </services>
               
            <br/>

            <div>You will need to <input type="button" value="register" id="register" onclick='page_buis.register()'/> in this site to access 
                some of the available services (including <a href="/buis">BUIS</a>). 
                <input type="button" value="Sign in" id="login" onclick='page_buis.log(true)'/>,
                <input type="button" value="Sign out" hidden='true' id="logout" onclick='page_buis.log(false)'/>
                if you already have registered.</div>
            <br/>
            <definers>
               <?php
                $mutall_rental->display_definers();
                ?>
                
            </definers>
        </nav>
        
        <!-- The articles section. -->
        <article >
            <?php
                $mutall_rental->display_page();
                ?>
               
        </article>

        <!-- The footer section -->
        <footer>
            <!-- This tag is needed for reporting mutall errors. On clicking
            clear the error--> 
            <p id='error' onclick='this.innerHTML=""'/>

        </footer>
    </body>

</html>
    