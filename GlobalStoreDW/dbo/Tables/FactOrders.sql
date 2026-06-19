-- 4. Create Orders Fact Table
CREATE TABLE [dbo].[FactOrders] (
    [RowID]         INT             NOT NULL,
    [OrderID]       VARCHAR (50)    NOT NULL,
    [CustomerID]    VARCHAR (50)    NOT NULL,
    [PostalCode]    VARCHAR (20)    NOT NULL,
    [ProductID]     VARCHAR (50)    NOT NULL,
    [OrderDate]     DATE            NOT NULL,
    [ShipDate]      DATE            NULL,
    [ShipMode]      VARCHAR (50)    NULL,
    [OrderPriority] VARCHAR (20)    NULL,
    [PaymentMode]   VARCHAR (50)    NULL,
    [Sales]         DECIMAL (18, 2) NOT NULL,
    [Quantity]      INT             NOT NULL,
    [Discount]      DECIMAL (5, 2)  NOT NULL,
    [Profit]        DECIMAL (18, 2) NOT NULL,
    [ShippingCost]  DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED ([RowID] ASC),
    CONSTRAINT [FK_FactOrders_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[dimCustomer] ([CustomerID]),
    CONSTRAINT [FK_FactOrders_Location] FOREIGN KEY ([PostalCode]) REFERENCES [dbo].[dimLocation] ([PostalCode]),
    CONSTRAINT [FK_FactOrders_Product] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[dimProduct] ([ProductID]),
    INDEX [IX_FactOrders_OrderDate] NONCLUSTERED ([OrderDate]),
    INDEX [IX_FactOrders_CustomerID] NONCLUSTERED ([CustomerID]),
    INDEX [IX_FactOrders_ProductID] NONCLUSTERED ([ProductID]),
    INDEX [IX_FactOrders_PostalCode] NONCLUSTERED ([PostalCode])
);
GO

