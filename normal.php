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

        <link id="mutall.css" rel="stylesheet" type="text/css" href='<?php echo "../library/mutall.css"; ?>'>

        <link id="mutall_rental.css" rel="stylesheet" type="text/css" href="mutall_rental.css">
        
        <link id="invoice.css" rel="stylesheet" type="text/css" href='invoice.css'>

        <!-- Scripts available from the shared library-->
        <!--script id='mutall.js' src="mutall.js"></script-->

        <!--Scripts that are local to this project-->
        <script id='mutall_rental.js' src="mutall_rental.js"></script>

        <!--Script for defining the objects needed for interacting with this page-->
        <script id='page'>
            //
            //Get rid of the header section. The bounding rect starts from the top
            //of the web browsers. To find the highest record in view, cater for 
            //the space taken by the header
            function remove_header(){
                //
                //.Start by getting the client height
                var win_height = document.documentElement.clientHeight;
                //
                //. Proceed with the getting the height of the article
                //Get the article element
                var div = document.getElementsByTagName("article")[0];
                //
                //Get its bounding rect
                var article_rect = div.getBoundingClientRect();
                //Set its height
                var art_height = article_rect.height;
                //
                //Get the difference between the window height and the article height
                //This will cater for the height taken by the header thus allowing
                //us to set the viewable port in any device
                var top = (win_height-art_height);
                //
                //Return the top
                return top;
            }               
            //
            //Set up the rule to determine the highest viewable
            function isinviewtop(elem){
                //
                //Call the function that eliminates the header
                var top= remove_header();
                //
                //Get the bouning rectangle of the element
                var bounding = elem.getBoundingClientRect();
                return (
                    bounding.top <= top &&
                    bounding.bottom >= top
                );
            };
            //
            //Also set up the rule to determine the lowest record viewable
            //
            function isinviewbottom(elem){
                //
                //Call the function that eliminates the header
                var top= remove_header();
                //
                //Get the bouning rectangle of the element
                var bounding = elem.getBoundingClientRect();
                return (
                    bounding.top >= top &&
                    bounding.top <= document.documentElement.clientHeight
                );
            };
            //
            //Scroll to the next record
            function next_record(){
                //
                //Get all the records
                var records = document.querySelectorAll('.record');
                //
                //Find the index of the last record. You need it for determine
                //when the next record is the same as the the highest vsible one
                last_record = records.length;
                //
                //Let i be the index of the highest visible
                var i;
                //
                //Loop through all records and starting from the bottom stop when 
                //you get to the first visible record
                for(i=last_record-1; i>=0; i--) {
                    //
                    //Get the i'th record
                    var record = records[i];
                    //
                    if (isinviewtop (record) || isinviewbottom (record)){
                        break;
                    }
                }
                //
                //Let n be the index of the next record after the highest visible one
                var n;
                //
                n= i===last_record-1 ? i : i+1;
                //
                //Return the next record
                //return records[n];
                var record = records[n];
                //
                //console.log(record);
                //
                //Scroll the record into view
                record.scrollIntoView();
                
            };
            //
            //
            //Scroll to the previous record
            function previous_record(){
                //Get all the record
                var records = document.querySelectorAll(".record");
                //
                //Get the index of the highest record. It is needed to help 
                //determine if it is the last record being viewed
                last_record = records.length;
                //
                //Let i be the index of the highest visible
                var i;  ``
                //
                //Loop through all records and starting from the top and stop when 
                //you get to the first visible record
                for(i=0; i<=last_record; i++) {
                    //
                    //Get the i'th record
                    var record = records[i];
                    //
                    if (isinviewtop (record) || isinviewbottom (record)){
                        break;
                    }
                }
                //
                //Let n be the index of the next record after the highest visible one
                var n;
                //
                n= i===last_record-1 ? i : i-1;
                //
                //Get the nth record
                var record = records[n];
                //
                //console.log(record);
                //
                //Scroll the record into view
                record.scrollIntoView();
            }
            //
            //Search through the records and display the one whose ID matches
            //the given key
            function search_creteria(key){
                //
                //Retrieve all the records to be searched
                var records = document.querySelectorAll('.record');
                
                console.log(records);
                //
                //Let i be the index of the record being searched
                var i;
                //
                //Loop through the records and retrieve the ids. We need the ids
                //to support the search function. The search will be based on the
                //record ids
                for(i=0; i<records.length; i++) {
                    //
                    //Get the ids of the records retrieved
                    var ids = records[i].getAttribute("id");
                    //
                    //Slice the string i.e. the ID to from the start to the length
                    //of the key. This means the entire key.
                    var slice_re = ids.slice(0,key.length);
                    //
                    //Check if the sliced id matches the key being typed. Break 
                    //off the loop if you find a match
                    if(key === slice_re){
                        break;
                    }
                }
                //scroll the record into view
                records[i].scrollIntoView();
                console.log(records[i]);
            }
        </script>            
    </head>

    <body>


        <!-- The non-scrolling part of this page contains the:- 
        - input area for specifying report criteria-->
        <header>
            <!--Search Invoices-->
            <form id="search">
                <!-- Specify method to be used
                <fieldset>
                    <legend>Method</legend>
                    <select name="method">
                        <option value="display">Display</option>
                        <option value="email">Email</option>
                        <option value="sms">SMS</option>
                    </select>
               </fieldset>
                <!-- Specify level to be used
                    <legend>Level</legend>
                    Detailed<input type="radio" name="Detailed" value="Detailed" />
                    Summary<input type="radio" name="Summary" value="Summary" />
               </fieldset>
                
                <!-- Specify Label to be used
                <fieldset>
                    <legend>Label</legend>
                    Tabular<input type="radio" name="Tabular" value="tabular" />
                    Layout_Mutal<input type="radio" name="Layout_mutall" value="layout_mutall" />
               </fieldset>
                
                 <!-- Specify Class to be used
                <fieldset>
                    <legend>Class</legend>
                    Poster<input type="radio" name="Tabular" value="tabular" />
                    Report<input type="radio" name="Layout_mutall" value="layout_mutall" />
               </fieldset>-->
                <!-- Specify the where clause of criteria-->
                <fieldset>
                    <legend>Search Creteria</legend>
                    <input 
                        type ="text" 
                        size="30"
                        id="criteria"
                        />
                    <input type="submit" value="Search">
                    <input type="button" value="Print">
                </fieldset>
            </form>
                
            <!--Navigate the page-->
            <navigation>
            <!-- Specify the where clause of criteria-->
            <label>Find in Page
                <input 
                    type ="text" 
                    size="30"
                    />
            </label> 

            <!-- Add next and previous buttons to help with the navigation of 
            the invoices-->
            <button onclick="previous_record()">Previous</button>
            <button onclick="next_record()">Next</button>
            </navigation>

        </header>
    <fdata></fdata>
        <!-- Capture  the vertical and horizontal scrolls for managing the 
       synchronisation of the report's top, left and body panes-->
        <article>
            <?php
                //
                //Display the invoice page in a detailed fashion
                $normal->display('layout_mutall', 'detailed', 'false');
            ?>
        </article>
        <script>
            var testForm = document.getElementById('search');
                testForm.onsubmit = function(event) {
                  event.preventDefault();

                  var request = new XMLHttpRequest();
                  // POST to normal.php which returns the POST data as JSON
                  request.open('POST', 'normal.php', /* async = */ false);

                  var formData = new FormData(testForm);
                  request.send(formData);

                  console.log(request.response);
                };
        </script>
    </body>
</html>
