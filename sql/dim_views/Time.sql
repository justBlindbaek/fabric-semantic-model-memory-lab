CREATE OR ALTER   VIEW dim.Time
AS
SELECT
    time_key       AS ID_Time,
    [hour]         AS Hour,
    [minute]       AS Minute,
    time_label     AS TimeLabel,
    hour_label     AS HourLabel,
    minute_label   AS MinuteLabel,
    am_pm          AS AmPm,
    part_of_day    AS PartOfDay,
    is_rush_hour   AS IsRushHour,
    is_night       AS IsNight
FROM dbo.dim_time_of_day;

GO

