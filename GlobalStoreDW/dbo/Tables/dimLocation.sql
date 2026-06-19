-- 3. Create Location Dimension
CREATE TABLE [dbo].[dimLocation] (
    [PostalCode] VARCHAR (20)  NOT NULL,
    [City]       VARCHAR (100) NOT NULL,
    [State]      VARCHAR (100) NOT NULL,
    [Country]    VARCHAR (100) NOT NULL,
    [Region]     VARCHAR (100) NULL,
    [Market]     VARCHAR (100) NULL,
    CONSTRAINT [PK_dimLocation] PRIMARY KEY CLUSTERED ([PostalCode] ASC)
);
GO