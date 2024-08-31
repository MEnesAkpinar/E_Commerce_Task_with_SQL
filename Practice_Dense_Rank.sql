--6. Write a query to return for each user the time elapsed between the first purchasing and the third purchasing, 
--in ascending order by Customer ID.




SELECT DISTINCT
	Cust_id,
	Order_Date,
	Dense_Number,
	First_Order_Date,
	DATEDIFF(DAY, First_Order_Date, Order_Date) AS Elapsed_Day
FROM 
	(SELECT 
		Cust_id,
		Order_Date,
		MIN(Order_Date) OVER (PARTITION BY Cust_id) AS First_Order_Date,
		DENSE_RANK () OVER (PARTITION BY Cust_id ORDER BY Order_Date) AS Dense_Number
	FROM combin_table
	) A
WHERE Dense_Number = 3
;



