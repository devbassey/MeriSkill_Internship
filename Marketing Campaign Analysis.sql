-- NAVIGATING INTO THE DATABASE
USE MeriskillOrderData;

-- AT GLANCE VIEW OF ALL DATA IN THE TABLE

SELECT * FROM dbo.Order_Data_meriskill;

SELECT TOP 10 * FROM DBO.Order_Data_meriskill;



-- DATA CLEANING PROCESS

-- IDENTIFYING AND REMOVING DUPLICATES

-- 1. Use Common Table Expressions (CTE) to Filter Duplicate Rows
WITH CTE AS (
    SELECT 
        OrderID, 
        CustID, 
        -- other columns you need,
        ROW_NUMBER() OVER (PARTITION BY OrderID, CustID ORDER BY OrderID) AS RowNum 
    FROM dbo.Order_Data_meriskill
)

--SELECT * FROM CTE
--WHERE RowNum = 1

-- Use Delete Clause to Delete Duplicate Rows

DELETE FROM CTE WHERE RowNum > 1;

   
-- STEP 2: TRIM WHITESPACES
UPDATE dbo.Order_Data_meriskill
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
    AcquisitionSource = LTRIM(RTRIM(AcquisitionSource));

-- STEP 3: Handling Missing Values
SELECT *
FROM dbo.Order_Data_meriskill
WHERE your_column IS NULL;
