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

    <body onload="loadData()">
        <article>
        </article>
        <script>
            function loadData() {
                var invoices = localStorage.getItem('_invoices');
                if (!invoices)
                    return false;
                localStorage.removeItem('_invoices');
                //decodes a string data encoded using base-64
                invoices = atob(invoices);
                //parses to Object the JSON string
                invoices = JSON.parse(invoices);
                //do what you need with the Object
                var article = document.querySelector('article');
                //console.log(article);
                //
                //Set the innerHtml to the responce.
                article.innerHTML = invoices;
                //fillFields(account.User, account.Pass);
                return true;
            }
        </script>
    </body>
</html>
