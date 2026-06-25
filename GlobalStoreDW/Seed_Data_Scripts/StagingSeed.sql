SET DATEFORMAT dmy;
GO

BULK INSERT [dbo].[Stag_Orders]
FROM 'd:\Home\Tejas\OneDrive\Projects\SQL-Data-Warehouse-Project\GlobalStoreDW\Seed_Data_Scripts\Data\global_superstore_2016.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n' -- This handles standard web/linux line breaks (\n) safely
);
