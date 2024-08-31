--3.Create a new column at combined_table as DaysTakenForDelivery that contains the date difference of Order


ALTER TABLE combin_table
ADD	DaysTakenForDelivery INT;


SELECT *
FROM combin_table
;


UPDATE combin_table
SET Order_Date = CONVERT(VARCHAR(10), CONVERT(DATETIME, Order_Date, 105), 120),
    Ship_Date = CONVERT(VARCHAR(10), CONVERT(DATETIME, Ship_Date, 105), 120)
;

SELECT 
	Order_Date, 
	Ship_Date,
	DaysTakenForDelivery = DATEDIFF(DAY, Order_Date, Ship_Date)
FROM combin_table
;

UPDATE combin_table
SET DaysTakenForDelivery = DATEDIFF(DAY, Order_Date, Ship_Date)
;

SELECT *
FROM combin_table
;