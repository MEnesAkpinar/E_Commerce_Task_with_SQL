--2. Create a view that keeps the number of monthly visits by users. (Separately for all months from the business beginning)
--Don't forget to call up columns you might need later.

CREATE VIEW number_of_visits AS 

SELECT
	Cust_id,
	[MONTH],
	[YEAR],
	COUNT(*) NUM_OF_LOG 
FROM customer_logs
GROUP BY 
	Cust_id,
	[MONTH],
	[YEAR]
;
	

SELECT * 
FROM number_of_visits
;