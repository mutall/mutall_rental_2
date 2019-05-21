<?php
//
//The index will will evoke methods, some of which are in the shared library, 
//while others are locally defined in this project. 

//
//The invice\page class, needed to lauch the index() function below, is defined in 
//the following shared library. Note how it is placed relative to this project
require_once "../library/invoice/classes.php";

//The following file contains classes that support the mutall_rental business
//and are specific to it.
require_once "model/invoice/classes.php";
//
//Now call the index process from the invoice namespace. Pass the home 
//directory to the page
invoice\page::index(__DIR__);
                    
