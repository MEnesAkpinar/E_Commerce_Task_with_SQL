--4. Find the customer whose order took the maximum time to get delivered.

SELECT TOP 1
	Customer_Name,
	DaysTakenForDelivery
FROM combin_table
ORDER BY DaysTakenForDelivery DESC
;



SELECT 
	Customer_Name,
	DaysTakenForDelivery
FROM combin_table
WHERE DaysTakenForDelivery = (SELECT MAX(DaysTakenForDelivery) 
							  FROM combin_table )
;