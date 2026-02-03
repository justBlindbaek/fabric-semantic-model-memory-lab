CREATE OR ALTER  VIEW dim.Date
AS
SELECT
    date_key                AS ID_Date,
    [date]                  AS [Date],
    [year]                  AS Year,
    quarter                 AS Quarter,
    [month]                 AS Month,
    month_name              AS MonthName,
    month_short             AS MonthShort,
    year_month              AS YearMonth,
    year_quarter            AS YearQuarter,
    day_of_month            AS DayOfMonth,
    day_of_week_iso         AS DayOfWeekIso,
    day_name                AS DayName,
    day_name_short          AS DayNameShort,
    week_of_year            AS WeekOfYear,
    is_weekend              AS IsWeekend,
    is_month_start          AS IsMonthStart,
    is_month_end            AS IsMonthEnd,
    is_us_federal_holiday   AS IsUsFederalHoliday,
    us_federal_holiday_name AS UsFederalHolidayName
FROM dbo.dim_date

UNION ALL

SELECT
    -1                      AS ID_Date,
    CAST('1900-01-01' AS date) AS [Date],
    1900                    AS Year,
    1                       AS Quarter,
    1                       AS Month,
    'Unknown'               AS MonthName,
    'Unknown'               AS MonthShort,
    '1900-01'               AS YearMonth,
    '1900-Q1'               AS YearQuarter,
    1                       AS DayOfMonth,
    1                       AS DayOfWeekIso,
    'Unknown'               AS DayName,
    'Unknown'               AS DayNameShort,
    1                       AS WeekOfYear,
    CAST(0 AS bit)          AS IsWeekend,
    CAST(0 AS bit)          AS IsMonthStart,
    CAST(0 AS bit)          AS IsMonthEnd,
    CAST(0 AS bit)          AS IsUsFederalHoliday,
    CAST(NULL AS varchar(100)) AS UsFederalHolidayName

GO

