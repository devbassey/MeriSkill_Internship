-- NAVIGATING INTO THE DATABASE
USE MeriskillOrderData;

-- AT GLANCE VIEW OF ALL DATA IN THE TABLE

SELECT * FROM dbo.Order_Data_meriskill;


-- DATA CLEANING PROCESS

-- STEP 1: IDENTIFYING AND REMOVING DUPLICATES

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
