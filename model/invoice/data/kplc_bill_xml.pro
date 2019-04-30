/*
 This version assumes that the current data file type is xml document that can be view as an html table
 using an embeded a style sheet. One of the headings -- message --  is used for feeding the variable text separated
 values. The xml data source has the following syntax:-

     xml FILENAME  OPTSTYLESHEET OPTDESCRIPTION
 */

 xml

 %The xml data file name
 "F:\mutall_project\mutall_business\ebill\sms-20170606151719 - edited.xml"

 %The explicit style sheet
 style_sheet "F:\mutall_project\mutall_business\ebill\sms.xsl"

 %Now enter Mutall statemets, vtsv being the only one for this version
 {
         %The vtsv command has the following syntax:-
          %
          %vtsv name(STRING) EXPRESSION LINE_SEPARATOR_TYPE lbrace TEXT_FIELDS rbrace  OPTDESCRIPTION
          vtsv

               %Name of the resulting table
               [t2]

               %Field (expression ) is the source of data
               [message]

               %Line separaror is the new line (nl) character, i.e., the hard return
               line_separated_by nl

               %Describe the text fields in terms of their field names and the variable text that separate them
               {
                    acno: ",ACCOUNT NO:", ", ACCOUNT NO:";
                    billdate: ":Curr bill dated", ": Curr bill dated", ": Current bill dated", ", Curr bill dated";
                    curramnt: "is KShs:";
                    currread: "Curr Read:", "CurrentReading:";
                    prevread: "Prev Read:", "PreviousReading:";
                    consumption: ",Consumption:", ", Consumption:",  ",Estimated Units:" ;
                    consamnt: "KWh, Amount:", "KWh,Amount:";
                    fuel: "Fuel Cost:";
                    levies: ",Levies:", ", Levies:";
                    taxes: ",Taxes:";
                    prevamnt: ".Prev Balance is KShs", ". Prev Balance is KShs", ".Prev Balance is KSh";
                    duedate: "Due date";
                    queryend: "."
               }

               %The optional description is about mapping the fields to thier database fields
               {
                    acno->emeter.account;
                    billdate->ebill.date;
                    curramnt->ebill.current_amount;
                    currread->ebill.current_reading;
                    prevread->ebill.prev_reading;
                    consumption->ebill.consumption;
                    consamnt->ebill.prev_amount;
                    fuel->ebill.fuel;
                    levies->ebill.levies;
                    taxes->ebill.taxes;
                    prevamnt->ebill.balance;
                    duedate->ebill.due_date
               }


 }







