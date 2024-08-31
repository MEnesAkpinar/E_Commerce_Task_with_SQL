--7. Write a query that returns customers who purchased both product 11 and product 14, 
--as well as the ratio of these products to the total number of products purchased by the customer.
--Use CASE Expression, CTE, CAST AND such Aggregate Functions


WITH Order_Check AS
(
SELECT 
	Cust_id,
	SUM(CASE WHEN Prod_id = 'Prod_11' THEN Order_Quantity ELSE 0 END) P11,
	SUM(CASE WHEN Prod_id = 'Prod_14' THEN Order_Quantity ELSE 0 END) P14,
	SUM(Order_Quantity) AS Total_Order
FROM combin_table
GROUP BY 
	Cust_id
HAVING 
	SUM(CASE WHEN Prod_id = 'Prod_11' THEN Order_Quantity ELSE 0 END) >= 1 AND
	SUM(CASE WHEN Prod_id = 'Prod_14' THEN Order_Quantity ELSE 0 END) >= 1
)

SELECT 
	Cust_id,
	P11,
	P14,
	Total_Order,
	CAST (CAST (P11/Total_Order AS NUMERIC (3,2)) * 100 AS VARCHAR(10)) + ' %' AS RATIO_P11,
	CAST (P14/Total_Order AS NUMERIC (3,2)) AS RATIO_P14
FROM Order_Check
;