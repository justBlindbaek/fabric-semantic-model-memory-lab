CREATE OR ALTER   VIEW dim.TaxiZonePickup
AS
SELECT
    LocationID   AS ID_TaxiZonePickup,
    Borough      AS Borough,
    Zone         AS Zone,
    service_zone AS ServiceZone
FROM dbo.dim_taxi_zone;

GO

