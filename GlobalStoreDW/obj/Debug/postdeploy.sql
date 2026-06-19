-- This file contains SQL statements that will be executed after the build script.
SET DATEFORMAT dmy;
GO

BULK INSERT [dbo].[Stag_Orders]
FROM '\Data\global_superstore_2016.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n' -- This handles standard web/linux line breaks (\n) safely
);

USE GlobalStoreDW;
GO


-- 1. Populate dimCustomer Safely
INSERT INTO dbo.dimCustomer (CustomerID, CustomerName, Segment)
SELECT 
    [Customer ID], 
    MAX([Customer Name]) AS CustomerName, -- Handles edge cases of conflicting names for one ID
    MAX([Segment])       AS Segment
FROM dbo.Stag_Orders
WHERE [Customer ID] IS NOT NULL
GROUP BY [Customer ID];




-- 2. Populate dimProduct Safely
INSERT INTO dbo.dimProduct (ProductID, ProductName, Category, SubCategory)
SELECT 
    [Product ID], 
    MAX([Product Name]) AS ProductName, -- Ensures a single unique row per ProductID
    MAX([Category])     AS Category,
    MAX([Sub-Category]) AS SubCategory
FROM dbo.Stag_Orders
WHERE [Product ID] IS NOT NULL
GROUP BY [Product ID];


-- 3. Populate dimLocation Safely
INSERT INTO dbo.dimLocation (PostalCode, City, State, Country, Region, Market)
SELECT 
    [Postal Code], 
    MAX([City])    AS City, -- Collects the primary attributes for each distinct PostalCode
    MAX([State])   AS State,
    MAX([Country]) AS Country,
    MAX([Region])  AS Region,
    MAX([Market])  AS Market
FROM dbo.Stag_Orders
WHERE [Postal Code] IS NOT NULL
GROUP BY [Postal Code];



-- 4. Finally, populate FactOrders Safely

INSERT INTO dbo.FactOrders ( 
    RowID, OrderID, CustomerID, PostalCode, ProductID, 
    OrderDate, ShipDate, ShipMode, OrderPriority, PaymentMode, 
    Sales, Quantity, Discount, Profit, ShippingCost 
)
SELECT 
    CAST([Row ID] AS INT),
    [Order ID],
    [Customer ID],    
    [Postal Code],    
    [Product ID],     
    TRY_CAST([Order Date] AS DATE),
    TRY_CAST([Ship Date] AS DATE),
    [Ship Mode],
    [Order Priority],
    [Payment Mode],
    CAST([Sales] AS DECIMAL(18,2)),
    CAST([Quantity] AS INT),
    CAST([Discount] AS DECIMAL(5,2)),
    CAST([Profit] AS DECIMAL(18,2)),
    CAST([Shipping Cost] AS DECIMAL(18,2))   
FROM dbo.Stag_Orders
WHERE [Row ID] IS NOT NULL;

GO
