--2. Find the top 3 customers who have the maximum count of orders.


SELECT TOP(3)
	Cust_id,
	Customer_Name,
	COUNT(Ord_id) AS "Total_Order"
FROM combin_table
GROUP BY Cust_id,
		 Customer_Name
ORDER BY total_order DESC
;