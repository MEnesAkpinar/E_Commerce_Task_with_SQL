--MONTH-WISE RETENTITION RATE


--Find month-by-month customer retention rate  since the start of the business.


--1. Find the number of customers retained month-wise. (You can use time gaps)



SELECT 
	DISTINCT Cust_id,
	[YEAR],
	[MONTH],
	CURRENT_MONTH,
	NEXT_VISIT_MONTH,
	--TIMES_GAP,
	COUNT(Cust_id) OVER (PARTITION BY NEXT_VISIT_MONTH) AS RETENTITON_MONTH_WISE
FROM New_Visit
--WHERE time_gap = 1
ORDER BY 
	Cust_id,
	NEXT_VISIT_MONTH
;


--2. Calculate the month-wise retention rate.

--Basic formula:
--Month-Wise Retention Rate = 1.0 * Number of Customers Retained in The Next Nonth / Total Number of Customers in The Previous Month

--It is easier to divide the operations into parts rather than in a single ad-hoc query. It is recommended to use View. 
--You can also use CTE or Subquery if you want.

--You should pay attention to the join type and join columns between your views or tables.

CREATE VIEW CURRENT_NUM_OF_CUST AS

SELECT 
	DISTINCT Cust_id,
	[YEAR],
	[MONTH],
	CURRENT_MONTH,
	COUNT(Cust_id) OVER (PARTITION BY CURRENT_MONTH) AS CURRENT_CUSTOMER
FROM New_Visit
;


SELECT *
FROM CURRENT_NUM_OF_CUST
;


CREATE VIEW NEXT_NUM_OF_CUST AS

SELECT	
	DISTINCT cust_id, 
	[YEAR],
	[MONTH],
	CURRENT_MONTH,
	NEXT_VISIT_MONTH,
	COUNT (cust_id)	OVER (PARTITION BY Current_Month) NEXT_CUST
FROM 
	New_Visit,
	time_gap
WHERE TIME_GAP = 1
AND	CURRENT_MONTH > 1


SELECT DISTINCT
		B.[YEAR],
		B.[MONTH],
		B.CURRENT_MONTH,
		1.0 * B.NEXT_CUST / A.CURR_CUST RETENTION_RATE
FROM	CURRENT_NUM_OF_CUST A 
LEFT JOIN NEXT_NUM_OF_CUST B
ON		A.CURRENT_MONTH + 1 = B.NEXT_VISIT_MONTH