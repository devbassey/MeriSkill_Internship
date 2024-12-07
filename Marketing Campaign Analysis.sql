USE MeriskillOrderData;


SELECT * FROM dbo.Order_Data_meriskill;


-- DATA CLEANING PROCESS

-- STEP 1: REMOVE DUPLICATES

SELECT OrderID, CustID, count(*) AS duplicate_value
FROM dbo.Order_Data_meriskill
GROUP BY OrderID, CustID
HAVING COUNT(*) > 1
ORDER BY OrderID ASC;

   
-- STEP 2: TRIM WHITESPACES
UPDATE dbo.Order_Data_meriskill
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
    AcquisitionSource = LTRIM(RTRIM(AcquisitionSource));
