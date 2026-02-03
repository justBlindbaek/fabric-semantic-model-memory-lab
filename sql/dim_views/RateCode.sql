CREATE OR ALTER   VIEW dim.RateCode
AS
SELECT
    RatecodeID           AS ID_RateCode,
    ratecode_description AS RateCodeDescription
FROM dbo.dim_ratecode;

GO

