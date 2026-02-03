CREATE OR ALTER   VIEW dim.PaymentType
AS
SELECT
    payment_type         AS ID_PaymentType,
    payment_description  AS PaymentTypeDescription
FROM dbo.dim_payment_type;

GO

