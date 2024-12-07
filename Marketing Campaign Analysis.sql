USE MeriskillOrderData;


SELECT * FROM dbo.Order_Data_meriskill;


-- DATA CLEANING PROCESS

-- STEP 1: REMOVE DUPLICATES

SELECT OrderID, CustID, ProductSKU, Customer_Name, count(*)
FROM dbo.Order_Data_meriskill
GROUP BY OrderID, CustID, ProductSKU, Customer_Name;

   
-- STEP 2: TRIM WHITESPACES
UPDATE dbo.Order_Data_meriskill
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
    AcquisitionSource = LTRIM(RTRIM(AcquisitionSource));
