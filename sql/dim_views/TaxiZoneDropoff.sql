CREATE OR ALTER   VIEW dim.TaxiZoneDropoff
AS
SELECT
    LocationID   AS ID_TaxiZoneDropoff,
    Borough      AS Borough,
    Zone         AS Zone,
    service_zone AS ServiceZone
FROM dbo.dim_taxi_zone;

GO

