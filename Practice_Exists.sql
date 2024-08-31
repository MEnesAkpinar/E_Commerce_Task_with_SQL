--5. Count the total number of unique customers in January 
--and how many of them came back every month over the entire year in 2011

SELECT COUNT(DISTINCT Cust_id) AS total_amount
FROM combin_table
WHERE 
	YEAR(Order_Date) = 2011
	AND MONTH(Order_Date) = 1 
;

SELECT 
	MONTH(Order_Date) [Month], 
	COUNT(DISTINCT cust_id) Monthly_Num_Of_Cust
FROM combin_table A
WHERE
EXISTS
(
SELECT Cust_id
FROM combin_table B
WHERE 
	YEAR(Order_Date) = 2011
	AND MONTH(Order_Date) = 1 
	AND A.Cust_id = B.Cust_id
)
AND YEAR(Order_Date) = 2011
GROUP BY MONTH(Order_Date)
;

