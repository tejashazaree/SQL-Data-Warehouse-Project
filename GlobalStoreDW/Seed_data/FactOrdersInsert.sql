

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
