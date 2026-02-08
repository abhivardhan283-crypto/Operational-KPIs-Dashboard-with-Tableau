-- Operational KPI Aggregation Query

WITH Cleaned_Data AS (
    SELECT
        CAST(ProductionDate AS DATE) AS Production_Date,
        MachineID,
        Shift,
        ISNULL(UnitsProduced, 0) AS UnitsProduced,
        ISNULL(DefectiveUnits, 0) AS DefectiveUnits,
        ISNULL(DowntimeMinutes, 0) AS DowntimeMinutes,
        ISNULL(PlannedProductionMinutes, 0) AS PlannedProductionMinutes
    FROM Operations_Data
)

SELECT
    Production_Date,
    MachineID,
    Shift,

    SUM(UnitsProduced) AS Total_Production,
    SUM(DefectiveUnits) AS Total_Defects,
    SUM(DowntimeMinutes)/60.0 AS Total_Downtime_Hours,

    -- Defect Rate %
    (SUM(DefectiveUnits)*100.0 / NULLIF(SUM(UnitsProduced),0)) 
        AS Defect_Rate_Percent,

    -- Downtime %
    (SUM(DowntimeMinutes)*100.0 / NULLIF(SUM(PlannedProductionMinutes),0))
        AS Downtime_Percent,

    -- Availability
    (1 - (SUM(DowntimeMinutes)*1.0 / NULLIF(SUM(PlannedProductionMinutes),0)))
        AS Availability,

    -- Quality
    ((SUM(UnitsProduced) - SUM(DefectiveUnits))*1.0 / NULLIF(SUM(UnitsProduced),0))
        AS Quality

FROM Cleaned_Data
GROUP BY
    Production_Date,
    MachineID,
    Shift
ORDER BY Production_Date;