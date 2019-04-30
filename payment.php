<?php
//Page for Capturing Water Readings
//
//Include the local Services PHP library and all her ancestors
require_once 'mutall_rental.php';
//
//Create a new instance of a water reading that drives this page and prepare to
//catch deployment errors
    $qstring = new querystring();
    //
    //Metadata for changing the class of 'description' from just a column to
    //column choices
    $metadata_str = '
        [
            {
                "fname": "description",
                "classname":"column_choices"
            },
            {
                "fname": "type",
                "classname":"column_choices"
            }
        ]
    ';
    $metadata = json_decode($metadata_str);
    //
    $qstring->arr['metadata'] = $metadata;
    //
    $page_record = new page_record($qstring);

    //Meaning of value()
    function value($fname) {
        //
        global $page_record;
        //
        return $page_record->page_field_value($fname);
    }

    //Meaning of check()
    function check($fname, $value, $boolatrr, $match = true) {
        //
        //
        global $page_record;
        //
        $page_record->check($fname, $value, $boolatrr, $match);
    }

    //
    //Add default values to fields of page record
    if (empty($page_record->driver->fields['date']->value)) {
        $page_record->driver->fields['date']->value = date('Y-m-d');
    }
    $payment = new adjustments();
    ?> 

    <html>
        <head>
            <title>Payment</title>

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
                var page_record = new adjustment(<?php echo $page_record; ?>);
                //console.log(page_record);
                var adjustments = new adjustments(<?php echo $payment; ?>);
                //
                function change(input, selector_type, has_sibbling = false, has_other = false) {
                    //
                    fname = input.name;

                    var field = page_record.driver.fields[fname];
                    //
                    field.change_field(input, page_record, selector_type, has_sibbling, has_other);
                }
            </script>
        </head>

        <!-- Properties of water reading that make reference to elements defined in 
        this page are only meaningfully instantiated on page load. Otherwise
        they will be incomplete -->
        <body>

        <div class="container mt-4">
            <!-- 
            Client selection button
            -->
        <div class="form-group row">
            <div class="col-md-3">
            <label for="amount" >Amount:</label>
                <input
                    type="number"
                    name="amount" 
                    onchange="change(this)"
                    value="<?php echo value('amount'); ?>"
                    />
                    </div>
                    <div class="col-md-3">
                    <label for="date" >Date:</label>
                <input
                    type="date"
                    name="date"    
                    onchange="change(this)"
                    value="<?php echo value('date'); ?>"
                    />
                    </div>
                    <div class="col-md-3">
                
            <label >Client:
                <input
                    type="button"
                    name="client" 
                    onclick="change(this)"
                    value="<?php echo value('client'); ?>"
                    />
            </label>
            </div>
            <div class="col-md-3">

            <label> Paid for
                <select name="description" onchange= "change(this, 'selector', false, true)">
                    <option hidden='true'>Click here to select</option>
                    <option <?php check('description', 'rent', 'selected'); ?> value="rent">Rent Only</option>
                    <option <?php check('description', 'security', 'selected'); ?> value="security">Security</option>
                    <option <?php check('description', 'gabbage', 'selected'); ?> value="gabbage" >Gabbage Collection</option>
                    <option <?php check('description', 'electricity', 'selected'); ?> value="electricity">Electricity</option>
                    <option <?php check('description', 'water', 'selected'); ?> value="water">Water</option>
                    <option <?php check('description', 'other', 'selected'); ?> value="other">Other</option>
                </select>
                <span  <?php echo value('description') == 'other' ? '' : 'hidden'; ?>>
                    Specify
                    <input 
                        type="text" 
                        onchange= "change(this)" 
                        value="specify"
                        />
                </span>
            </label>
            </div>
</div>
            <h3> Mode of Payment:</h3>

            <label>Mpesa:
                <input
                    name="type"
                    type="radio"
                    value="mpesa"
                    <?php check('type', 'mpesa', 'checked'); ?>
                    onchange="change(this, 'radio', true)"
                    />
                <span <?php check('type', 'mpesa', 'hidden', false); ?>>Code:
                    <input 
                        type="text"
                        name="ref"
                        onchange="change(this)"
                        value="<?php echo value('ref'); ?>"
                        />
                </span>
            </label>

            <label>Cheque:
                <input
                    name="type"
                    type="radio"
                    value="cheque"
                    onchange="change(this, 'radio', true)"
                    <?php check('type', 'cheque', 'checked'); ?>
                    />
                <span <?php check('type', 'cheque', 'hidden', false); ?>> Number:
                    <input 
                        type="text"
                        name="ref"
                        onchange="change(this)"
                        value="<?php echo value('ref'); ?>"
                        />
                </span>
            </label>

            <label>Bank Slip:
                <input
                    name="type"
                    type="radio"
                    value="bank_slip"
                    onchange="change(this, 'radio', true)"
                    <?php check('type', 'bank_slip', 'checked'); ?>
                    />
                <span <?php check('type', 'bank_slip', 'hidden', false); ?>>Ref Number:
                    <input 
                        type="text"
                        name="ref"
                        onchange="change(this)"
                        value="<?php echo value('ref'); ?>"
                        />
                </span>

            </label>
        <send>
            <input 
                id='save_current_record' 
                type="button" 
                value="Save Record" 
                onclick="page_record.save_current_record()"
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
                        <th>Amount</th> 
                        <th>Reference</th>
                        <th>Paid For</th>

                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    $results = $payment->get_payment();
                    while ($result = $results->fetch_assoc()) {
                        ?>
                        <tr class="content" primarykey="<?php echo $result['payment']; ?>">
                            <td><?php echo $result['title']; ?></td>
                            <td><?php echo $result['name']; ?></td>
                            <td><?php echo $result['date']; ?></td>
                            <td><?php echo $result['amount']; ?></td>
                            <td><?php echo $result ['ref']; ?></td>
                            <td><?php echo $result ['description']; ?></td>
                        </tr>

                        <tr class="content hidden">
                            <td colspan="3">
                                <input type="button" class="btn btn-default" value="Edit" onclick="adjustments.edit(this)"/>
                            </td>
                            <td colspan="4">
                                <input type="button" class="btn btn-danger" value="Delete" onclick="adjustments.delete(this)"/>
                            </td>
                        </tr>
                        <tr class=""> 
                            
                        </tr>
                    <?php }; ?>
                    </tbody>
                </table>
            </div>
        </article>

            <!-- This tag is needed for reporting mutall errors. On clicking
                clear the error--> 
            <p id='error' onclick='this.innerHTML = ""'></p>
        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script>
            page_record.selectTr();
        </script>
    </body>     
    </html>

     