-- 2. Create Product Dimension
CREATE TABLE [dbo].[dimProduct] (
    [ProductID]   VARCHAR (50)  NOT NULL,
    [ProductName] VARCHAR (255) NOT NULL,
    [Category]    VARCHAR (100) NOT NULL,
    [SubCategory] VARCHAR (100) NULL,
    CONSTRAINT [PK_dimProduct] PRIMARY KEY CLUSTERED ([ProductID] ASC)
);
GO