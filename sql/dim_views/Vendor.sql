CREATE OR ALTER   VIEW dim.Vendor
AS
SELECT
    VendorID   AS ID_Vendor,
    vendor_name AS VendorName
FROM dbo.dim_vendor;

GO

