
-- 1. Populate dimCustomer Safely
INSERT INTO dbo.dimCustomer (CustomerID, CustomerName, Segment)
SELECT 
    [Customer ID], 
    MAX([Customer Name]) AS CustomerName, -- Handles edge cases of conflicting names for one ID
    MAX([Segment])       AS Segment
FROM dbo.Stag_Orders
WHERE [Customer ID] IS NOT NULL
GROUP BY [Customer ID];