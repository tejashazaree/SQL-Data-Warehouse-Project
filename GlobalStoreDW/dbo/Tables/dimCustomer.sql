-- 1. Create Customer Dimension
CREATE TABLE [dbo].[dimCustomer] (
    [CustomerID]   VARCHAR (50)  NOT NULL,
    [CustomerName] VARCHAR (255) NOT NULL,
    [Segment]      VARCHAR (100) NULL,
    CONSTRAINT [PK_dimCustomer] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);
GO