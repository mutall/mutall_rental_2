<?php
//
//Include the local Services PHP library and all her ancestors
require_once 'mutall_rental.php';
//
//Create a new instance of a water reading that drives this page and page_recordepare to
//catch deployment errors
$qstring = new querystring();
//
//Now let pr be an instance of a page record class
$pr = new page_record($qstring);
//
//Set teh defautl date to that of today
if (empty($pr->driver->fields['date']->value)) {
    $pr->driver->fields['date']->value = date('Y-m-d');
}
$adjustments = new adjustments();


?> 

<html>
    <head>
        <title>Balance</title>

        <!-- Make the page phone sensitive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Style all Buis pages have the same theme-->
        <!--<link id="mutall.css" rel="stylesheet" type="text/css" href="../library/mutall.css"/>-->

        <!-- Local style-->
        <link id="page_record.css" rel="stylesheet" type="text/css" href="wreading_record.css"/>
        <!-- bootstrap cdn -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <!-- Include the Services Javascript library and all her ancestors-->
        <script id='mutall.js' src="../library/mutall.js"></script>

        <!--Use the local services (before sharing them)-->
        <script id='mutall_rental.js' src="mutall_rental.js"></script>

        <!--Interface between PHP to Javascript objects-->
        <script id='interface'>
            //
            //Let pr be the javascript instance of a record 
            var pr = new adjustment(<?php echo $pr; ?>);
            //
            var adjustments = new adjustments(<?php echo $adjustments; ?>);
            //
            //Let dr_cr be our complex debit and credit column
            var dr_cr = new column_dr_cr(pr);
            
            
        </script>
    </head>

    <!-- Properties of water reading that make reference to elements defined in 
    this page are only meaningfully instantiated on page load. Otherwise
    they will be incomplete -->
    <body>

    <div class="container mt-4">
        <div class="form-group row">
            <div class="col-md-3">        
                <label for ="date"> Balance as of Date:</label>
                <input
                    type="date"
                    name="date"    
                    onchange="pr.page_change_field(this)"
                    value="<?php echo $pr->page_field_value('date'); ?>"
                    />
            </div>
            <div class="col-md-3">
                <label for ="client"> For Client:</label>
                <input
                    type="button"
                    name="client" 
                    onclick="pr.page_change_field(this)"
                    value="<?php echo $pr->page_field_value('client'); ?>"
                    />  
            </div>
            
            <div class="col-md-3">
                <label for="debit">Debit:</label>
                    <input
                    <?php echo!empty($pr->page_field_value('debit')) ? "checked" : ""; ?>
                        name="mode"
                        type="radio"
                        value="debit"
                        onchange="dr_cr.change_field(this)"
                        />
                    <span 
                    <?php echo empty($pr->page_field_value('debit')) ? "hidden" : ""; ?>
                        >
                        Ksh:
                        <input 
                            type="number"
                            name="debit"
                            value="<?php echo $pr->page_field_value('debit'); ?>"
                            onchange="pr.page_change_field(this)"
                            />
                    </span>
                <label for="credit">Credit:</label>
                    <input
                    <?php echo!empty($pr->page_field_value('credit')) ? "checked" : ""; ?>
                        name="mode"
                        type="radio" 
                        value="credit"
                        onchange="dr_cr.change_field(this)"
                        />
                        <span 
                        <?php echo empty($pr->page_field_value('credit')) ? "hidden" : ""; ?>
                            >
                            Ksh:
                            <input  
                                type="number"
                                name="credit"
                                value="<?php echo $pr->page_field_value('credit'); ?>"
                                onchange="pr.page_change_field(this)"
                                />
                        </span>
                </label>
            </div>
        </div>
    <send>
        <input 
            id='save_current_record' 
            type="button" 
            value="Save Record" 
            onclick="pr.save_current_entry()"
            >
    </send>
    <article class="container mt-3">
        <div>
            <table class="table table-responsive-md">
                <thead>
                <tr >
                    <th>Client</th>
                    <th>Short Name</th>
                    <th>Date</th>
                    <th>Debit</th> 
                    <th>Credit</th>
                </tr>
                </thead>
                <tbody>
                <?php $results = $adjustments->get_balance(); 
                    while($result = $results->fetch_assoc()) { ?>
                        <tr class="content" primarykey="<?php echo $result['balance_initial']; ?>">
                            <td><?php echo $result['title']; ?></td>
                            <td><?php echo $result['name']; ?></td>
                            <td><?php echo $result['date']; ?></td>
                            <td><?php echo $result['debit']; ?></td>
                            <td><?php echo $result ['credit']; ?></td>
                        </tr>
                        <tr class="content hidden">
                                <td colspan="3">
                                    <input type="button" class="btn btn-default" value="Edit" onclick="adjustments.edit(this)"/>
                                </td>
                                <td colspan="4">
                                    <input type="button" class="btn btn-danger" value="Delete" onclick="adjustments.delete(this)"/>
                                </td>
                        </tr>
                    <?php }; ?>
                </tbody>
            </table>
        </div>
    </article>
        <!-- This tag is needed for reporting mutall errors. On clicking
            clear the error--> 
        <p id='error' onclick='this.innerHTML = ""'></p>
        <script>
            pr.selectTr();
        </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>   
    </div>
</body>

</html>

