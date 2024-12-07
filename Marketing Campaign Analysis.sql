USE MeriskillOrderData;

-- Data Cleaning

SELECT * FROM dbo.Order_Data_meriskill;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove columns and row that are not relevant


    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY OrderID, TransactionID ORDER BY OrderID) AS RowNum
    FROM dbo.Order_Data_meriskill;


UPDATE dbo.Order_Data_meriskill
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
    AcquisitionSource = LTRIM(RTRIM(AcquisitionSource));
