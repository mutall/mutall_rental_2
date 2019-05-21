<?php
//
//The index will will evoke methods, some of which are in the shared library, 
//while others are locally defined in this project. 

//
//The invice\page class, needed to lauch the index() function below, is defined in 
//the following shared library. Note how it is placed relative to this project
require_once "../library/invoice/classes.php";

//The following files contains classes that support the mutall_rental business
//and are specific to it.
//
//Classes revolving around the Invoicin system
require_once "model/invoice/classes.php";

//Classes revolving around Kenya Power Billig.
require_once "model/electricity.php";

//
//Now call the index process from the invoice namespace. Pass the home 
//directory to the page
invoice\page::index(__DIR__);
                    
