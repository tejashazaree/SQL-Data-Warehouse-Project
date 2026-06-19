

-- 3. Populate dimLocation Safely
INSERT INTO dbo.dimLocation (PostalCode, City, State, Country, Region, Market)
SELECT 
    [Postal Code], 
    MAX([City])    AS City, -- Collects the primary attributes for each distinct PostalCode
    MAX([State])   AS State,
    MAX([Country]) AS Country,
    MAX([Region])  AS Region,
    MAX([Market])  AS Market
FROM dbo.Stag_Orders
WHERE [Postal Code] IS NOT NULL
GROUP BY [Postal Code];
