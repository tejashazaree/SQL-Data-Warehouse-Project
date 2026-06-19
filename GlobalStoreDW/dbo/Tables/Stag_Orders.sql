CREATE TABLE [dbo].[Stag_Orders]
(
    [Row ID]         float         NULL,
    [Order ID]       nvarchar(255) NULL,
    [Order Date]     datetime      NULL,
    [Ship Date]      datetime      NULL,
    [Ship Mode]      nvarchar(255) NULL,
    [Order Priority] nvarchar(255) NULL,
    [Payment Mode]   nvarchar(255) NULL,
    [Customer ID]    nvarchar(255) NULL,
    [Customer Name]  nvarchar(255) NULL,
    [Segment]        nvarchar(255) NULL,
    [Postal Code]    nvarchar(255) NULL,
    [City]           nvarchar(255) NULL,
    [State]          nvarchar(255) NULL,
    [Country]        nvarchar(255) NULL,
    [Region]         nvarchar(255) NULL,
    [Market]         nvarchar(255) NULL,
    [Product ID]     nvarchar(255) NULL,
    [Product Name]   nvarchar(255) NULL,
    [Category]       nvarchar(255) NULL,
    [Sub-Category]   nvarchar(255) NULL,
    [Sales]          money         NULL,
    [Quantity]       float         NULL,
    [Discount]       float         NULL,
    [Profit]         money         NULL,
    [Shipping Cost]  float         NULL
)
GO
