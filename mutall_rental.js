//The class that represents the mutall_data page; the input is data originating
//from a PHP enviromnemt and needed for construtng this page
function mutall_data(input) {
    //
    //A mutall_data page extends the page class; this is where it is initialized
    page.call(this, input);

}


//Modelling the water readings
function wreading(input) {
    //
    page_records.call(this, input);
    //
    //Put the current dom record into edit mode
    this.edit_record = function() {
        //
        //Get the current dom record, alerting the user if none is selected
        var dom_record = this.get_current_dom_record();
        //
        //Retrieve the primary key
        //
        //Get the values of the dom record
        var values = dom_record.get_values();
        //
        //The primary key field ha sthe same name as that of this pag's table
        //name
        var primarykey = values[this.tname];
        //
        //Get querystring of this page
        var qstring = this.arr;
        //
        //Add the primary key
        qstring.primarykey = primarykey;
        //
        this.open_window("wreading_record.php", qstring);

    };
}

//Modelling a water reading record
function wreading_record(input) {
    //
    //Debugging
    console.log(input);
    //
    page.call(this, input);
    //
    //The last reading object
    this.last_reading = new last_reading(this);
    //
    this.consumption = new consumption(this);
    //
    //Create the water reading date instance based on the column_ext which
    //extends the ordinary column in the following ways:-
    //
    //1-The column has a page property that allows access to this page 
    //within the field 
    //
    //2-It has all properties of the field by the given name from
    //this page's driver record
    //
    //3-It has a named input element associated with it and deribed from this 
    //page, so, the element is at load time, not at wreading construction 
    //time.
    //
    //4-It overrides the edit behaviour to not only edit the field but 
    //also fire the the show_last_reading function
    this.current_date = new column_water(this, 'date', 'date');
    //
    //The water reading (value) is a water column; note that the actual field name is different
    //from the input element's id
    this.current_wreading = new column_water(this, 'reading', 'current_reading');
    //
    //Activate the water meter field originating from the PHP. Perhaps a
    //better option is to create a new object that has 3 parematers
    //1-the incoming data
    //2-the input element
    //3-this page
    this.wmeter = new wmeter_column(this);


    //Retrieve the last reading
    this.retrieve_last_reading = function() {
        //
        //Compile the data needed for showing last reading; they are:-
        //- the reference (current) date
        //- the water meter id
        //In addition:-
        //- the data that initiated this page
        //
        //Get the original querystring that initiated this page
        var qstring = this.arr;
        //
        //Add the current reference date value
        qstring.date = this.current_date.input().value;
        //
        //Add the meter id
        qstring.wmeter = this.wmeter.primarykey;
        //
        //Now request teh server for the servive 
        this.ajax("get_last_reading", qstring, "json", function(result) {
            //
            //Check teh status
            if (result.status === "ok") {

                //Xtract the data returned by the function
                var data = result.extra;
                //
                this.last_reading.input().value = data.value;
                //
                //Remember date is a span
                this.last_reading.date().innerHTML = data.date;
                //
                //The consumption of this water reading must change
                this.consumption.onchange();
            }
        });

    }; //Save the record's data to the server using the ajax method

    //Quality control the input values and save them to the database
    this.save_values = function() {
        //
        //Do a quality control check of all the input values and on ok, return 
        //them
        var values = this.qc();
        //
        //Do not continue if the values are not valid
        if (!values)
            return;
        //
        //By default the input values should be inserted, rather than updated
        var update = typeof this.update === "undefined" ? false : this.update;
        //
        var qstring = {
            //
            //Identify the database and table name to save record to
            dbname: this.dbname,
            tname: this.tname,
            update: update,
            //  
            //Remember to json encode the name/value pairs
            values: JSON.stringify(values)
        };
        //
        //Add a primary key if this is an existing record
        if (typeof this.primarykey !== "undefined" && this.primarykey !== null) {
            qstring.primarykey = this.primarykey;
        }
        //
        //Use the ajax method to save the values
        this.ajax("save_values", qstring, "json", function(result) {
            //
            switch (result.status) {
                case "ok":
                    //
                    //Refresh this page
                    window.location.reload();
                    break;
                case "error":
                    //
                    //Show the error from html property
                    this.show_error_msg(result.html);
                    break
                default:
                    this.show_error_msg("Unknown ajax result status '" + result.status + "'");
            }
        });

    };

    //Do a quality control check and return the values to be wrtiten to the 
    //database
    this.qc = function() {
        //
        //Start with an empty set of values
        var values = {};
        //
        //The date must be provided
        values.date = this.current_date.input().value;
        //
        //Validate the date
        if (typeof values.date === "undefined" ||
            values.date === "" ||
            values.date === null) {
            this.show_error_msg("Please input a valid date");
            //
            return false;
        }
        //
        //The water meter primary key value must be known
        values.wmeter = this.wmeter.primarykey;
        //
        //Validate the water meter number
        if (typeof values.wmeter === "undefined" ||
            values.wmeter === "" ||
            values.wmeter === null) {
            this.show_error_msg("Please select a valid water meter number");
            return false;
        }
        //
        //The reading value must be valid
        values.value = this.current_wreading.input().value;
        //
        //Validate teh value
        if (typeof values.value === "undefined" ||
            values.value === "" ||
            values.value === null) {
            this.show_error_msg("Please input a valid meter reading value");
            return false;
        }
        //
        //Check for negative consumption
        var c = this.consumption.input().value;
        if (c < 0) {
            this.show_error_msg("Consumption cannot be negative");
            return false;
        }
        //
        //Return the compiled value
        return values;
    };

    //Update the water consumption
    this.calculate_consumption = function() {
        //
        //Let r0 be the last last reading
        var r0 = this.last_reading.input().value;
        //
        //Let r1 be the current reading
        var r1 = this.current_wreading.input().value;
        //
        //Assume that r0 and r1 are valid values
        var valid = true;
        //
        //Define teh invalie conditions
        if (r0 === "")
            valid = false;
        if (r1 === "")
            valid = false;
        if (typeof r0 === "undefined")
            valid = false;
        if (typeof r1 === "undefined")
            valid = false;
        //
        //Let c be the water consumption; its null if any of the readings is null
        var c = valid ? r1 - r0 : null;
        //
        var input = this.consumption.input();
        //
        //Get the consumption and update the display
        input.value = c;
        //
        //Set the color status to red if c is negative
        if (c === null) {
            input.setAttribute("class", "null");
        } else if (c < 0) {
            input.setAttribute("class", "error");
        } else {
            input.setAttribute("class", "ok");
        }
    };

    //Check the "update earlier record" option

};


//The last reading extends column water by a date companion and teh retrieval
//method
function last_reading(wreading) {
    //
    field_water.call(this, wreading, 'last_reading');
    //
    //Offload the static data; it will be overwriiten with new more valid ones
    this.offload(wreading.last_reading);
    //
    this.date = function() {
        //
        //Initialize the date cpmponent
        var i = window.document.getElementById('last_date');
        //
        return i;
    };

};

//
function adjustment(input) {
    //
    page_record.call(this, input);
    //This method is created to just as the save current record in the library 
    //but does alittle bit diffrent i.e,. to handle the debit and credit 
    //Quality control the input values and save them to the database
    this.save_current_entry = function() { //adjustent
        //
        //Ccollect the values to save
        var values = this.collect_values();
        //
        //Do not continue if they fail the quality control check
        if (!this.qc_dr_cr(values))
            return;
        //
        //By default the input values should be inserted, rather than updated
        var update = typeof this.update === "undefined" ? false : this.update;
        //
        var qstring = {
            //
            //Identify the database and table name to save record to
            dbname: this.dbname,
            tname: this.tname,
            update: update,
            //  
            //Remember to json encode the name/value pairs
            values: JSON.stringify(values)
        };
        //
        //Add a primary key if this is an existing record
        if (typeof this.primarykey !== "undefined" && this.primarykey !== null) {
            qstring.primarykey = this.primarykey;
        }
        //
        //Use the ajax method to save the values
        this.ajax("save_values", qstring, "json", function(result) {
            //
            switch (result.status) {
                case "ok":
                    //
                    //Refresh the page
                    window.location.reload();
                    //
                    //Invite the user to perform furter actiions after after a 
                    //successful saving of a record.
                    this.after_save_adjustment()(values);
                    break;
                case "error":
                    //
                    //Show the error from html property
                    this.show_error_msg(result.html);
                    break
                default:
                    this.show_error_msg("Unknown ajax result status '" + result.status + "'");
            }
        });

    };
    //
    //The quality control function is developed to check the value of field 
    //before they are save to the db. Especialt in case where we only have to save 
    //one value e.g,. debit or credit.
    this.qc_dr_cr = function(values) {
        //
        //This if stament is ment to solve the saving of null 
        //values in the debit and credit fields: 
        if (this.empty(values.debit) && this.empty(values.credit)) {
            //
            alert("Both debit and credits cannot be null");
            return false;
        }
        //
        if (!this.empty(values.debit) && !this.empty(values.credit)) {
            //
            alert("Either the debit or the credit should be valid. Not both");
            return false;
        }
        //
        //
        if (this.empty(values.client)) {
            alert("Pleas input the client");
            return false;
        }
        return true;
    };

    //Show the ok message after saving
    this.after_save_adjustment = function(values) {
        //
        //window.open("balance.php?dbname=mutallco_rental&tname=balance_initial");
    }

    this.selectTr = function() {
        //
        //the variable _this
        let _this = this;
        //
        //the variable getTr.
        let getTr = document.getElementsByClassName("content");

        //
        //looping through the results one by one to get the length of the tr.
        for (var i = 0; i < getTr.length; i++) {

            getTr[i].onclick = function() {

                _this.activeSelector(this);
            };
        }

    }


    this.activeSelector = function(tr) {
        //
        //the variable 'current'
        let current = document.getElementsByClassName("active");

        //
        //the append of the result for next plot to be selected.
        if (!current[0]) {
            tr.className += " active";
            //
            //the selection of the next property thet uses a inbuilt fuunction replace 
            //to replace the active selection
        } else {
            current[0].className = current[0].className.replace(" active", "");
            tr.className += " active";
        }

    }
}

function adjustments(input) {
    //calling the parent
    page_records.call(this, input);

    //
    this.delete = function(input) {
        //
        var active = document.querySelector(".active");

        // var tr = input.parentNode.parentNode;
        //
        var primarykey = active.getAttribute("primarykey");
        //
        //Confirm the delete and continue if necessary.
        var yes = window.confirm("Do you really want to delete this row?");
        //
        if (!yes) return;
        //
        var qstring = {
            dbname: this.dbname,
            tname: this.tname,
            //
            //Ensure the primary key is posted. Example of querying teh view 
            //part of a dom record
            primarykey: primarykey
        };
        //
        //Execute the delete record method on the page_record object. 
        this.ajax("delete_record", qstring, "json", function(result) {
            //
            if (result.status === "ok") {
                //
                //Rather than refreshing an entire page, simply remove/detacch 
                //the view of the dom_record from its parent. do some 
                //investigation around dom_record.view.getParent().remove(dom_record.view);
                window.location.reload();
            }
            //
            //Otherwise show the error message
            else {
                this.show_error_msg(result);
            }
        });
    };
    this.edit = function(input) {
        //
        var page_name = this.tname;
        //
        var active = document.querySelector(".active");
        //
        var primarykey = active.getAttribute("primarykey");
        //
        var qstring = {
            dbname: this.dbname,
            tname: this.tname,
            primarykey: primarykey
        };

        //
        //this.open_window("http://localhost/mutall_rental/balance.php?dbname=mutallco_rental&tname=balance_initial&primarykey=primarykey", qstring);
        //this.open_window("balance.php", qstring);
        window.open(page_name + ".php?dbname=mutallco_rental&tname=" + this.tname + "&primarykey=" + primarykey, "_self");

    };
};


//Extend the mutall column so that it is useful in this water reading context
function column_water(wreading, fname, input_fname) {
    //        
    //Offload the properties of the equivalent field in PHP at this point so that
    //they can be overritten in the steps that follow
    //
    //Get the named field from the page record
    var field = wreading.driver.fields[fname];
    //
    for (var prop in field) {
        this[prop] = field[prop];
    }
    //
    //Having imported teh field values, now override them
    this.wreading = wreading;
    //
    this.fname = fname;
    //
    //Initialize he parent. It appears like the word field is resrved???? Im 
    //anable to instantiate a field. Change to column
    field_water.call(this, wreading, input_fname);
};

//Extend the mutall column
// so that it is useful in this water reading context
function field_water(wreading, input_name) {
    //
    this.wreading = wreading;
    this.input_name = input_name;
    //
    //Field is a mutall object -- otherwise it wont access basic mutall 
    //functions 
    mutall.call(this);
    //
    //Set the input element
    this.input = function() {
        //
        //Let i be the input element for this field
        var i = window.document.getElementById(this.input_name);
        //
        //Test if the input is found
        if (i === null) {
            alert("Input element " + this.input_name + " not found");
        };
        //
        return i;
    };


    //Propagate the change to the input element
    this.onchange = function() {
        //
        //Get the input element
        var i = this.input();
        //
        //Effect the change
        i.onchange();
    };
};

function consumption(wreading) {
    //
    field_water.call(this, wreading, 'consumption');

};

//
//In future, constructors should be called with sensible arghuments that help
//us to understand the expectetion of this class. Passing a whole wreading 
//record is important but too heavy
function wmeter_column(wreading) {
    //
    //The field name and water input element have the same name
    column_water.call(this, wreading, 'wmeter', 'wmeter');
    //
    //Offload the properties of the water meter (passed on from php) to this record
    for (var prop in wreading.wmeter) {
        this[prop] = wreading.wmeter[prop];
    }
    //
    //Edit the water meter
    this.edit = function() {
        //
        //Define the dimension specifications of the selection window and place 
        //it relative to the input field
        var top = 0;
        var left = this.input().offsetLeft;
        var specs = "top=" + top + ",left=" + left + ",height=400,width=400";
        //
        //Prepare the (subfield) data to send to the selector: current output, 
        //id, and primarykey values
        var qstring = {
            //
            //The foreign key table name is the water meter
            tname: "wmeter",
            //
            //Use the same dbname as that of this page
            dbname: this.wreading.dbname,
            //
            //Any other (filtering condition)
            //
            //Set the values from the subfields of this foreign key. This is
            //the data that extends a page_records to a page_selector
            output: this.output,
            id: this.id,
            primarykey: this.primarykey
        };
        //
        ///Request the server to open a new selector page, with the given input
        //and wait for user to interact with it; on return (when the window is closed)
        //extract the subfield values. Note how the url is formulated to ensure
        //that we can can this page from projects other than Buis; the relative
        //location of the project is important
        this.open_window("../library/page_selector.php", qstring, function(subfield) {
            //
            //Extract the retunred data to the field; the fields are idxed by the
            //field names of the primary, id and input columns; hence the leading 
            //underbar
            this.value = subfield._output;
            this.id = subfield._id;
            this.primarykey = subfield._primary;
            //
            //Get the input element
            var input = this.input();
            //
            //Set the input's value to the output
            input.value = this.value;
            //
            //Fire the onchange event, because we have made the change 
            //programmaticaly; otherwise it wont fire automatically
            input.onchange();
        }, specs);
    };

};

//Modelling kplc msg
function msg(input) {
    //
    page_records.call(this, input);

    //Export the selected messages to ebill
    this.export = function() {
        //
        //Collect the data we want to expoty to php
        var qstring = this.arr;

        this.ajax("export", qstring, "html", function(result) {
            alert(result);
        });
    };


    //Show e-accounts that are not in the displayed in this (ebill) messages
    this.xor_show = function() {
        //
        //Compile the message selection criteria tat will be xored
        var xor_criteria = typeof this.arr.criteria === "undefined" ? null : this.arr.criteria;
        //
        //This is teh only piece of data required to constructo mising accounts
        var qstring = {
            xor_criteria: xor_criteria
        };
        //
        //Open the window od missing accounts
        this.open_window("eaccount_missing.php", qstring);
    };
}

//Modelling kplc eaccount_missing as an extension of eaccount
function eaccount_missing(input) {
    //
    eaccount.call(this, input);

    this.send_sms_2kplc = function() {
        //developing the connection to php send to kplc function

        var qstring = this.arr;

        qstring.sms_stmt = this.driver.stmt;

        this.ajax("send_sms_2kplc", qstring, "html", function(result) {
            alert(result);
        });

    };

};

//Modelling kplc ebill
function ebill(input) {
    //
    page_records.call(this, input);
    //
    //
    this.email_lovinah_report = function() {
        var qstring = this.arr;

        this.ajax("email_lovinah_report", qstring, "json", function(result) {
            alert(result.status);
        });
    };
};

function eaccount(input) {

    page_records.call(this, input);

    this.send_sms_2kplc = function() {
        var qstring = this.arr;

        this.ajax("send_sms_2kplc", qstring, "html", function(result) {
            alert(result);
        });

    };

    //Save the sql (that was usd for producing the current xored results) to the
    //job table
    this.save_2_job = function() {
        //
        //Propgage teh querystring that was usd for evoking this page
        var qstring = this.arr;
        //
        this.ajax("save_2_job", qstring, "json", function(result) {
            //
            //Checking teh results
            switch (result.status) {
                //
                case "ok":
                    alert(result.extra);
                    break;
                case "error":
                    alert(result.html);
                    break;
                default:
                    alert("Invalid ajax return status " + result.status);
            }

        });

    };
}

//Modelling multiple choices
function column_choices(input) {
    //
    //calling the column class 
    column.call(this, input.name);
    //
    this.offload(input);

    //Invite the user/caller to execute further user defined function
    //dependent on the change. For the selector, by default, we show show 
    //the show the óthe/specify
    this.change_extra = function(input) {
        //
        switch (this.selector_type) {
            //
            ///
            case 'selector':
                //
                //Modelling the radio buttom selector; the choces are all vsible but only one is 
                //selected. We assume that next sibbling to teh radio are elements that should
                //be mage visible when the a voice is made
                //Show the othe/specify field if requested
                if (!this.has_other)
                    return;
                //
                if (input.value === 'other') {
                    //    
                    input.nextElementSibling.removeAttribute('hidden');
                } else {
                    //
                    input.nextElementSibling.setAttribute('hidden', 0);
                }
                break;
            case 'radio':
                //Modelling a selector/dropdown. The choices are not visible until you drop 
                //them down, but only one is seleccted. We also assume that one of teh options
                //is 'other' -- in which case the specify input field is expected to be the next
                //sibbling
                //
                //Execute the code that follows if we have sibblings associated with the 
                //input
                if (!this.has_sibbling)
                    return;
                //
                //Special case of radio
                //E.g., text, date, email, nuber, etc
                //
                //Switch on the bits that are relevant and off those that are
                //not
                nodes = document.querySelectorAll('[name=' + input.name + ']');
                for (var i = 0; i < nodes.length; i++) {
                    //
                    //Get the i'th node
                    node = nodes[i];
                    //
                    if (input.value === node.value) {
                        //
                        //Switch on
                        node.nextElementSibling.removeAttribute('hidden');
                    } else {
                        //
                        //Switch off
                        node.nextElementSibling.setAttribute('hidden', true);
                    }
                }

                break;
            default:
                alert("Selector type " + this.selector_type + " not known");
        }
    };
}

//Model the debit/credit input system. Th page record paramenter is needed in 
//order to access fields that constitute the debit and credit fields.
//This field extends the column class with a special change field method 
function column_dr_cr(page_record) {
    //
    this.page_record = page_record;
    //
    //This field is made up of two table columns:debit and credit.So the (single) 
    //column name needed for constructing a column is not meaningful.
    column.call(this, null);

    //
    //For the dr_cr the main behavoir for this function is that users can 
    //either debit or credit clients but not both
    //Reference is the radio button from we call this function.
    this.change_field = function(ref) { //column_dr_cr
        //
        //Let radio be all the list of the availble radio inputs that have 
        //the same name as our reference inputs 
        var radio = document.querySelectorAll('input[ name = ' + ref.name + ']');
        //
        //Let curr_value be the current (non empty) value of a debit or credit field 
        var curr_value = null;
        //
        //Look for curr_value from all the input fields 
        for (var i = 0; i < radio.length; i++) {
            //
            //The input field is the first child of the refrence sibling 
            var field = radio[i].nextElementSibling.firstElementChild;
            //
            //set the current value to the non empty field value 
            if (!this.empty(field.value)) {
                //
                //Display the input
                curr_value = field.value;
            }
        }
        //
        //Displaying or hide the radio field depending on the reference 
        for (var i = 0; i < radio.length; i++) {
            //
            //Let span be the sibling of the i'th radio field.
            var span = radio[i].nextElementSibling;
            //
            //The input field is the first child of the refrence sibling 
            var field = radio[i].nextElementSibling.firstElementChild;
            //
            //Let fname be the field name
            var fname = field.name;
            //
            if (radio[i] === ref) {
                //
                //The radio matches the reference
                //
                //Display the spanned field
                span.removeAttribute('hidden');
                //
                //Transfer the curr_value to the field
                field.value = curr_value;
                //
                //Ensure that the page record strutre is updated
                this.page_record.driver.fields[fname].value = curr_value;

            } else {
                //
                //This is where the radio doen't match the reference
                //
                //Hide the spanned field.
                span.setAttribute('hidden', 0);
                //
                //Set the field value to null.
                field.value = null;
                //
                //Ensure that the page record strutre is updated
                this.page_record.driver.fields[fname].value = null;
            }

        }
    };
}