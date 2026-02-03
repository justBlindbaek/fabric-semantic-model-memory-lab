CREATE OR ALTER   VIEW fct.YellowTaxi
AS
SELECT
    CASE
        WHEN pickup_date_key IS NOT NULL
         AND (pickup_date_key / 10000) = [year]
            THEN pickup_date_key
        ELSE -1
    END AS ID_Date,
    pickup_time_key          AS ID_Time,
    VendorID_clean           AS ID_Vendor,
    RatecodeID_clean         AS ID_RateCode,
    payment_type_clean       AS ID_PaymentType,
    PULocationID_clean       AS ID_TaxiZonePickup,
    DOLocationID_clean       AS ID_TaxiZoneDropoff,

--  measures columns
    passenger_count          AS M_PassengerCount,
    trip_distance            AS M_TripDistance,
    fare_amount              AS M_FareAmount,
    extra                    AS M_Extra,
    mta_tax                  AS M_MtaTax,
    tip_amount               AS M_TipAmount,
    tolls_amount             AS M_TollsAmount,
    improvement_surcharge    AS M_ImprovementSurcharge,
    congestion_surcharge     AS M_CongestionSurcharge,
    airport_fee              AS M_AirportFee,
    cbd_congestion_fee       AS M_CbdCongestionFee,
    total_amount             AS M_TotalAmount,
 
 -- intentionally expensive columns
    pickup_datetime          AS PickupDatetime,
    CAST(pickup_datetime AS date) AS PickupDate,
    CAST(pickup_datetime AS time(0)) AS PickupTime,
--  dropoff_datetime         AS DropoffDatetime,
    payment_identifier       AS PaymentIdentifier,
--  trip_surrogate_id        AS TripSurrogateId,

--  partition columns
--  [month]                  AS Month,
    [year]                   AS Year
    
FROM dbo.fact_yellow_taxi;

GO

