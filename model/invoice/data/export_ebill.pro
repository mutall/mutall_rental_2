database connection "SERVER=mutall.co.ke;DRIVER={MySQL ODBC 5.3 Unicode Driver};DATABASE=mutallco_rental;UID=mutallco;PORT=3306;PWD=mutall_2015"
%database connection "SERVER=localhost;DRIVER={MySQL ODBC 5.3 Unicode Driver};DATABASE=mutallco_rental2;UID=mutallco;PORT=3306;PWD=mutall2015"

/*
query [msg]
	sql
	"SELECT"
          "`msg`.`id` AS msg_id,"
		"`msg`.`body` AS msg_body,"
		"`msg`.`date` AS msg_date "
	"FROM"
		"`msg`"
     {
		msg_body -> [msg].[body];
		msg_date -> [msg].[date];
		msg_id -> [msg].[id]

    }

 query [ebill]
	sql
	"SELECT"
		"ebill.due_date AS ebill_due_date,"
		"ebill.current_amount AS ebill_current_amount,"
          "ebill.is_posted AS ebill_is_posted,"
		"eaccount.num AS eaccount_num,"
		"msg_ebill.msg,"
		"msg_ebill.msg_id AS msg_ebill_msg_id,"
		"invoice_ebill.invoice,"
		"invoice_ebill.invoice_is_valid AS invoice_ebill_invoice_is_valid,"
		"invoice_ebill.client_name AS invoice_ebill_client_name,"
		"invoice_ebill.period_year AS invoice_ebill_period_year,"
		"invoice_ebill.period_month AS invoice_ebill_period_month"
	"FROM"
		"((ebill INNER JOIN "
		"eaccount ON ebill.eaccount = eaccount.eaccount) LEFT JOIN "
		"("
	"SELECT"
		"msg.msg AS msg,"
		"msg.id AS msg_id"
	"FROM"
		"msg"
		")  AS msg_ebill ON ebill.msg = msg_ebill.msg) LEFT JOIN "
		"("
	"SELECT"
		"invoice.invoice AS invoice,"
		"invoice.is_valid AS invoice_is_valid,"
		"client.name AS client_name,"
		"period.year AS period_year,"
		"period.month AS period_month"
	"FROM"
		"(invoice INNER JOIN "
		"client ON invoice.client = client.client) INNER JOIN "
		"period ON invoice.period = period.period"
		")  AS invoice_ebill ON ebill.invoice = invoice_ebill.invoice"
	{
		ebill_due_date -> [ebill].[due_date];
		ebill_current_amount -> [ebill].[current_amount];
		ebill_is_posted -> [ebill].[is_posted];
		eaccount_num -> [eaccount].[num];
          {
               msg_ebill_msg_id -> [msg].[id]
           };
          {
               invoice_ebill_invoice_is_valid -> [invoice].[is_valid];
               invoice_ebill_client_name -> [client].[name];
               invoice_ebill_period_year -> [period].[year];
               invoice_ebill_period_month -> [period].[month]}
           }

*/

query [wreading]
	sql
	"SELECT"
		"`wreading`.`date` AS wreading_date,"
		"`wreading`.`value` AS wreading_value,"
		"`wreading`.`remark` AS wreading_remark,"
		"`wmeter`.`num` AS wmeter_num"
	"FROM"
		"`wreading` INNER JOIN "
		"`wmeter` ON `wreading`.`wmeter` = `wmeter`.`wmeter`"
	{
		wreading_date -> [wreading].[date];
		wreading_value -> [wreading].[value];
		wreading_remark -> [wreading].[remark];
		wmeter_num -> [wmeter].[serial_no]
	}
