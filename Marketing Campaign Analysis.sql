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
--WHERE RowNum = 1;

-- 2. Use Delete Clause to Delete Duplicate Rows

DELETE FROM CTE WHERE RowNum > 1;

   
-- STEP 2:STANDARDAIZING THE DATA
-- 1. Update the Order_Data_meriskill table to trim whitespace from specified columns

UPDATE dbo.Order_Data_meriskill
SET 
    OrderID = LTRIM(RTRIM(OrderID)),
    Region = LTRIM(RTRIM(Region)),
    Country = LTRIM(RTRIM(Country)),
    CustID = LTRIM(RTRIM(CustID)),
    Customer_Name = LTRIM(RTRIM(Customer_Name)),
    ProductSKU = LTRIM(RTRIM(ProductSKU)),
    Product_Category = LTRIM(RTRIM(Product_Category)),
    OrderLineItem = LTRIM(RTRIM(OrderLineItem)),
    OrderQuantity = LTRIM(RTRIM(OrderQuantity)),
    ProductCost = LTRIM(RTRIM(ProductCost)),
    ProductPrice = LTRIM(RTRIM(ProductPrice)),
    OrderDate = LTRIM(RTRIM(OrderDate)),
    AcquisitionSource = LTRIM(RTRIM(AcquisitionSource)),
    TransactionID = LTRIM(RTRIM(TransactionID)),
    Fraud = LTRIM(RTRIM(Fraud)),
    PaymentMethod = LTRIM(RTRIM(PaymentMethod)),
    CardType = LTRIM(RTRIM(CardType)), 
    Gender = LTRIM(RTRIM(Gender))
WHERE 
    OrderID IS NOT NULL 
    OR Region IS NOT NULL 
    OR Country IS NOT NULL 
    OR CustID IS NOT NULL
    OR Customer_Name IS NOT NULL
    OR ProductSKU IS NOT NULL
    OR Product_Category IS NOT NULL
    OR OrderLineItem IS NOT NULL
    OR OrderQuantity IS NOT NULL
    OR ProductCost IS NOT NULL
    OR ProductPrice IS NOT NULL
    OR OrderDate IS NOT NULL
    OR AcquisitionSource IS NOT NULL
    OR TransactionID IS NOT NULL
    OR Fraud IS NOT NULL
    OR PaymentMethod IS NOT NULL
    OR CardType IS NOT NULL
    OR Gender IS NOT NULL;



-- STEP 3: Handling Missing Values
--1. Identifying Missing Data

SELECT 
    OrderID, Region, Country, CustID, Customer_Name, ProductSKU, Product_Category, 
    OrderLineItem, OrderQuantity, ProductCost, ProductPrice, OrderDate, AcquisitionSource, 
    TransactionID, Fraud, PaymentMethod, CardType, Gender
FROM 
    dbo.Order_Data_meriskill
WHERE 
    OrderID IS NULL 
    OR Region IS NULL 
    OR Country IS NULL 
    OR CustID IS NULL 
    OR Customer_Name IS NULL 
    OR ProductSKU IS NULL 
    OR Product_Category IS NULL 
    OR OrderLineItem IS NULL 
    OR OrderQuantity IS NULL 
    OR ProductCost IS NULL 
    OR ProductPrice IS NULL 
    OR OrderDate IS NULL 
    OR AcquisitionSource IS NULL 
    OR TransactionID IS NULL 
    OR Fraud IS NULL 
    OR PaymentMethod IS NULL 
    OR CardType IS NULL 
    OR Gender IS NULL;


DELETE FROM dbo.Order_Data_meriskill
WHERE 
    OrderID IS NULL 
    OR Region IS NULL 
    OR Country IS NULL 
    OR CustID IS NULL 
    OR Customer_Name IS NULL 
    OR ProductSKU IS NULL 
    OR Product_Category IS NULL 
    OR OrderLineItem IS NULL 
    OR OrderQuantity IS NULL 
    OR ProductCost IS NULL 
    OR ProductPrice IS NULL 
    OR OrderDate IS NULL 
    OR AcquisitionSource IS NULL 
    OR TransactionID IS NULL 
    OR Fraud IS NULL 
    OR PaymentMethod IS NULL 
    OR CardType IS NULL 
    OR Gender IS NULL;


select gender from dbo.Order_Data_meriskill where gender is null
