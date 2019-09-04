<?php

namespace invoice;

//
//
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
//Let Url be the deafault parameters of the url
$url_params = [];
//
//Set the class value.
$url_params['class'] = $_REQUEST['class'];
//Set the method
$url_params['method'] = $_REQUEST['method'];
//Set the layout
$url_params['layout'] = $_REQUEST['layout'];
//Set the level
$url_params['level'] = $_REQUEST['level'];
//Set the year
//$url_params['year'] = $_REQUEST['year'];
//Set the month
//$url_params['month'] = $_REQUEST['month'];
//
//Now call the index process from the invoice namespace. Pass the home 
//directory to the page
$normal = new poster_mutall();

function check($name, $array) {
    if (in_array($name, $array)) {
        echo "checked";
    }
}

function select($name, $array) {
    if (in_array($name, $array)) {
        echo "selected";
    }
}
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
            function remove_header() {
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
                var top = (win_height - art_height);
                //
                //Return the top
                return top;
            }
            //
            //Set up the rule to determine the highest viewable
            function isinviewtop(elem) {
                //
                //Call the function that eliminates the header
                var top = remove_header();
                //
                //Get the bouning rectangle of the element
                var bounding = elem.getBoundingClientRect();
                return (
                        bounding.top <= top &&
                        bounding.bottom >= top
                        );
            }
            ;
            //
            //Also set up the rule to determine the lowest record viewable
            //
            function isinviewbottom(elem) {
                //
                //Call the function that eliminates the header
                var top = remove_header();
                //
                //Get the bouning rectangle of the element
                var bounding = elem.getBoundingClientRect();
                return (
                        bounding.top >= top &&
                        bounding.top <= document.documentElement.clientHeight
                        );
            }
            ;
            //
            //Scroll to the next record
            function next_record() {
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
                for (i = last_record - 1; i >= 0; i--) {
                    //
                    //Get the i'th record
                    var record = records[i];
                    //
                    if (isinviewtop(record) || isinviewbottom(record)) {
                        break;
                    }
                }
                //
                //Let n be the index of the next record after the highest visible one
                var n;
                //
                n = i === last_record - 1 ? i : i + 1;
                //
                //Return the next record
                //return records[n];
                var record = records[n];
                //
                //console.log(record);
                //
                //Scroll the record into view
                record.scrollIntoView();
            }
            ;
            //
            //
            //Scroll to the previous record
            function previous_record() {
                //Get all the record
                var records = document.querySelectorAll(".record");
                //
                //Get the index of the highest record. It is needed to help 
                //determine if it is the last record being viewed
                last_record = records.length;
                //
                //Let i be the index of the highest visible
                var i;
                ``
                //
                //Loop through all records and starting from the top and stop when 
                //you get to the first visible record
                for (i = 0; i <= last_record; i++) {
                    //
                    //Get the i'th record
                    var record = records[i];
                    //
                    if (isinviewtop(record) || isinviewbottom(record)) {
                        break;
                    }
                }
                //
                //Let n be the index of the next record after the highest visible one
                var n;
                //
                n = i === last_record - 1 ? i : i - 1;
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
            function search_creteria(key) {
                //
                //Retrieve all the records to be searched
                var records = document.querySelectorAll('.record');
                //
                //Let i be the index of the record being searched
                var i;
                //
                //Loop through the records and retrieve the ids. We need the ids
                //to support the search function. The search will be based on the
                //record ids
                for (i = 0; i < records.length; i++) {
                    //
                    //Get the ids of the records retrieved
                    var ids = records[i].getAttribute("id");
                    //
                    //Slice the string i.e. the ID to from the start to the length
                    //of the key. This means the entire key.
                    var slice_re = ids.slice(0, key.length);
                    //
                    //Check if the sliced id matches the key being typed. Break 
                    //off the loop if you find a match
                    if (key === slice_re) {
                        break;
                    }
                }
                //scroll the record into view
                records[i].scrollIntoView();
            }
        </script>            
    </head>

    <body>


        <!-- The non-scrolling part of this page contains the:- 
        - input area for specifying report criteria-->
    <header_items>
        <!--Search Invoices-->
        <form id="search">
            <!-- Specify Class to be used-->
            <fieldset>
                <legend>Class</legend>
                Poster
                <input type="radio" name="class" 
                    value="poster_mutall" 
                    <?php check('poster_mutall', $url_params) ?>
                    onchange="show_date()"
                />
                Report
                <input type="radio" name="class" 
                    value="report_mutall"  
                    <?php check('report_mutall', $url_params) ?>
                    onchange="show_date(false)"
                />
                <input 
                    type ="date" 
                    size="15"
                    id="date_type"
                    value="<?php echo date('Y-m-d'); ?>"
                />
            </fieldset>

            <!-- Specify method to be used-->
            <fieldset>
                <legend>Method</legend>
                <select name="method">
                    <option value="display"<?php select('selector', $url_params) ?>>Select Method</option>
                    <option value="display"<?php select('display', $url_params) ?>>Display</option>
                    <option value="email"<?php select('email', $url_params) ?>>Email</option>
                    <option value="sms"<?php select('sms', $url_params) ?>>SMS</option>
                    <option value="post"<?php select('post', $url_params) ?>>Post</option>
                </select>
            </fieldset>

            <!-- Specify Label to be used-->
            <fieldset id="layout">
                <legend>Layout</legend>
                Tabular
                <input type="radio" name="layout" 
                    value="layout_tabular" 
                    <?php check('layout_tabular', $url_params) ?> 
                />
                Mutal
                <input type="radio" name="layout" 
                    value="layout_mutall"
                    <?php check('layout_mutall', $url_params) ?>
                />
            </fieldset>

            <!-- Specify level to be used-->
            <fieldset>
                <legend>Level</legend>
                Detailed
                <input type="radio" name="level" 
                    value="detailed"
                    <?php check('detailed', $url_params) ?>
                />
                Summary
                    <input type="radio" name="level" 
                    value="summary" 
                    <?php check('summary', $url_params) ?>
                />
                
            </fieldset>

            <!-- Specify the where clause of criteria-->
            <fieldset>
                <legend>Search By</legend>
                <input 
                    type ="text" 
                    size="15"
                    id="criteria"
                    placeholder="Client.name"
                    />
                <input type="button" value="Search" onclick="get_record(this)"/>
                <input type="button" value="Print" onclick="print_record(this)">
            </fieldset>
        </form>
        <navigator>
            <!--Navigate the page-->
            <!-- Specify the where clause of criteria-->
            <label>Go to client
                <input 
                    type ="text" 
                    size="30"
                    onkeyup="search_creteria(this.value)"
                    />
            </label> 

            <!-- Add next and previous buttons to help with the navigation of 
            the invoices-->
            <button onclick="previous_record()">Previous</button>
            <button onclick="next_record()">Next</button>
            <nbsp> To Update records click <a 
                    href="http://mutall.co.ke/buis/page_buis.php?psync=true">
                    HERE</a></nbsp>
        </navigator>
    </header_items>
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

        //
        //Get records from the server
        function get_record(input) {
            //
            //
            //Create new formdata
            var formData = new FormData();
            //
            //Get the parent of the parent element
            var parent = input.parentNode.parentNode;
            //
            //Get all the field sets in the parent
            var fields = parent.querySelectorAll('fieldset');
            //
            //Loop through the fieldsets and to retrieve the key value pairs of
            //the querystring
            fields.forEach(function (field) {
                //
                //Get the key.
                var legend = field.querySelector('legend');
                //
                //Get all the inputs in the field
                var inputs = field.querySelectorAll('input');
                //
                //Test for the selected attribute.
                inputs.forEach(function (input) {
                    if (input.checked) {
                        //
                        //Set the value of the input to match the name of the lagend.
                        formData.append(legend.innerText.toLowerCase(), input.value);
                    }
                });
                //
                //Get the method to be passed.
                var e = field.querySelector('select');
                if (e) {
                    //
                    //Get the value of the selector.
                    var txt = e.options[e.selectedIndex].text;
                    //
                    //Set the legend to the value of the text.
                    formData.append(legend.innerText.toLowerCase(), txt);
                    //
                    //Get the year using the selector id


                }

                //Get the year and the month by first getting the input field
                var ym = document.querySelector('#date_type');
                if (ym){
                    //Create a new date object from the input element value
                    var date = new Date(ym.value);
                    //
                    //Get the month from the created date
                    var month = date.getMonth() + 1;
                    //
                    //Set the month
                    formData.append('month', month);
                    //
                    //Get the year from the created date
                    var year = date.getFullYear();
                    //
                    //Set the year
                    formData.append('year', year);
                }
                //
                //Get the value of the search criteria.
                var search = document.querySelector('#criteria');
                if (search) {
                    var value = search.value;
                    //
                    //Cater for cases where their is no criteria
                    if (value) {
                        //
                        //Do the criteria
                        var criteria = "client.name= '" + value + "'";
                        //
                        //Set the criteria 
                        formData.append('criteria', criteria);
                    }
                }

            });
            ajax(formData, 'article');

        }
        function ajax(data, html_elemet) {
            //
            //Create a new xmlHTTP
            var server = new XMLHttpRequest();
            //
            //Open a channel to the server.
            server.open('POST', 'index.php');
            //
            //Call the callback function to determine successful interaction with server
            server.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    //
                    //Get the responce form the server and place it in the 
                    //article section
                    //
                    //
                    var article = document.querySelector(html_elemet);
                    //console.log(article);
                    //
                    //Set the innerHtml to the responce.
                    article.innerHTML = this.responseText;
                    
                    
                    console.log(this.responseText);
                    //
                    //Save to localstorage for access to other pages.
                    saveData(this.responseText);
                }
            };
            //
            //send the data.
            server.send(data);
        }
        function print_record(input) {
            //get the form data response
            //
            //
            //Open a new window. The window will be used to print saved data from
            //the form data. The data is pasted on the opened window
            var win = window.open("http://mutall.co.ke/development/mutall_rental/print.php",
                    "Print_Records", "resizable,scrollbars,status");
        }
        //
        //Save data from the form data section. It is the responsetext from the
        //xmlHTMLRequest
        function saveData(data) {
            var invoices = data;
            //converts to JSON string the Object
            invoices = JSON.stringify(invoices);
            //creates a base-64 encoded ASCII string
            invoices = btoa(invoices);
            //save the encoded accout to web storage
            localStorage.setItem('_invoices', invoices);
        }
        function show_date(date=true){
            //
            //Get the date field using its id
            var elem = document.querySelector('#date_type');
            //
            //Hide date if poster is false
            if(!date){
                //
                //Set the date display attribute to hidden
                elem.setAttribute('hidden', 'true');
            }
            else{
                elem.removeAttribute('hidden');
            }
        }
    </script>

</body>
</html>
