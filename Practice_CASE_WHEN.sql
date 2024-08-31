--4. Calculate the monthly time gap between two consecutive visits by each customer.
--Don't forget to call up columns you might need later.

SELECT * 
FROM New_Visit
;


CREATE VIEW time_gap AS

SELECT 
	Cust_id,
	(NEXT_VISIT_MONTH - CURRENT_MONTH) AS TIMES_GAP
FROM New_Visit
;

SELECT *
FROM time_gap
;


--5.Categorise customers using average time gaps. Choose the most fitted labeling model for you.
--  For example: 
--	Labeled as churn if the customer hasn't made another purchase in the months since they made their first purchase.
--	Labeled as regular if the customer has made a purchase every month.
--  Etc.


SELECT 
	Cust_id,
	AvgTimesGap,
	CASE WHEN AvgTimesGap = 1 THEN 'Retained' 
		 WHEN AvgTimesGap > 1 THEN 'Irregular'
		 WHEN AvgTimesGap IS NULL THEN 'Churn' ELSE 'UNKNOWN DATA' END CUST_LABELS
FROM 
	(SELECT
		Cust_id,
		AVG(TIMES_GAP) AS AvgTimesGap
	FROM time_gap
	GROUP BY Cust_id
	) A
;