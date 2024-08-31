--CUSTOMER RETENTION ANALYSIS

--1. Create a view that keeps visit logs of customers on a monthly basis. (For each log, three field is kept: Cust_id, Year, Month)
--Use such date functions. Don't forget to call up columns you might need later.


CREATE VIEW customer_logs AS

SELECT 
	Cust_id,
	MONTH(Order_Date) [MONTH],
	YEAR(Order_Date) [YEAR] 
FROM combin_table
;

SELECT * 
FROM customer_logs
ORDER BY 
	1,
	2,
	3;