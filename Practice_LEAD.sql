--3. For each visit of customers, create the next month of the visit as a separate column.
--You can number the months with "DENSE_RANK" function.
--then create a new column for each month showing the next month using the numbering you have made. (use "LEAD" function.)
--Don't forget to call up columns you might need later.



CREATE VIEW New_Visit AS

SELECT 
	*,
	LEAD(CURRENT_MONTH, 1) OVER (PARTITION BY Cust_id ORDER BY CURRENT_MONTH) AS NEXT_VISIT_MONTH
FROM 
(
SELECT 
	*,
	DENSE_RANK() OVER (ORDER BY [YEAR], [MONTH]) AS CURRENT_MONTH
FROM number_of_visits
) A
;


SELECT * 
FROM New_Visit
;