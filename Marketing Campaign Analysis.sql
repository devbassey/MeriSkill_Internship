-- NAVIGATING INTO THE DATABASE
USE MeriskillOrderData;

-- AT GLANCE VIEW OF ALL DATA IN THE TABLE

SELECT * FROM dbo.Order_Data_meriskill;

SELECT TOP 10 * FROM DBO.Order_Data_meriskill;



-- DATA CLEANING PROCESS

-- IDENTIFYING AND REMOVING DUPLICATES

-- 1. Use Common Table Expressions (CTE)
WITH CTE AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY OrderID, CustID ORDER BY OrderID) AS RowNum 
    FROM dbo.Order_Data_meriskill
)

SELECT * FROM CTE
WHERE RowNum > 1;







SELECT OrderID, CustID, count(*) AS duplicate_value
FROM dbo.Order_Data_meriskill
GROUP BY OrderID, CustID
HAVING COUNT(*) > 1
ORDER BY OrderID ASC;

SELECT DISTINCT OrderID
from dbo.Order_Data_meriskill

   
-- STEP 2: TRIM WHITESPACES
UPDATE dbo.Order_Data_meriskill
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
    AcquisitionSource = LTRIM(RTRIM(AcquisitionSource));
