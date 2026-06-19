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
