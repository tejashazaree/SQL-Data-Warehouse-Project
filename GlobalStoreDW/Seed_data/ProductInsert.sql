



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