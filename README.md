# 📊 Operational KPIs Dashboard with Tableau

## 📌 Project Overview

This project presents an **Operational KPI Dashboard** built using **Tableau Desktop**, analyzing production performance, downtime, and quality metrics.

Operational data was originally assumed to be sourced from a **SQL Server database**, extracted using structured queries, and then used for visualization and KPI analysis.

The dashboard enables interactive monitoring of:

* Production output
* Downtime percentage
* Defect rate
* Overall Equipment Effectiveness (OEE)
* Machine-level and shift-level performance

The dataset contains **270 operational records**, covering multiple machines and 3 daily shifts (Day, Evening, Night).

---

## 🛠 Tech Stack

* **Database:** Microsoft SQL Server
* **Data Extraction:** SQL Queries
* **Data Source for Demo:** Excel (.xlsx) exported from SQL Server
* **Visualization Tool:** Tableau Desktop
* **Deployment:** Tableau Public

---

## 📂 Repository Structure

```
├── Operational_Data.xlsx
├── Operational_KPI_Extraction.sql
├── Operational_KPI_Dashboard.twbx
├── README.md
```

---

## 🗄 SQL Data Extraction

Operational metrics were extracted from SQL Server using structured aggregation queries to compute:

* Total Production
* Total Downtime
* Defect Rate
* Availability
* Quality
* OEE components

### Sample SQL Logic Used

```sql
SELECT
    CAST(ProductionDate AS DATE) AS Production_Date,
    MachineID,
    Shift,
    SUM(UnitsProduced) AS Total_Production,
    SUM(DefectiveUnits) AS Total_Defects,
    SUM(DowntimeMinutes) AS Total_Downtime,
    SUM(PlannedProductionMinutes) AS Planned_Time
FROM Operations_Data
GROUP BY
    CAST(ProductionDate AS DATE),
    MachineID,
    Shift;
```

The extracted data was exported for dashboard development and visualization.

---

## 📊 Dataset Description

The dataset simulates operational manufacturing data with the following columns:

| Column Name              | Description                                     |
| ------------------------ | ----------------------------------------------- |
| Production_Date          | Date of production                              |
| MachineID                | Machine identifier                              |
| Shift                    | Day / Evening / Night                           |
| UnitsProduced            | Total units produced                            |
| DefectiveUnits           | Number of defective units                       |
| DowntimeMinutes          | Downtime in minutes                             |
| PlannedProductionMinutes | Planned production time (480 minutes per shift) |

---

## 📈 Key KPIs Calculated in Tableau

### Total Production

```
SUM(UnitsProduced)
```

### Defect Rate (%)

```
SUM(DefectiveUnits) / SUM(UnitsProduced)
```

### Downtime (%)

```
SUM(DowntimeMinutes) / SUM(PlannedProductionMinutes)
```

### Availability

```
1 - (DowntimeMinutes / PlannedProductionMinutes)
```

### Quality

```
(UnitsProduced - DefectiveUnits) / UnitsProduced
```

### OEE (Overall Equipment Effectiveness)

```
Availability × Quality
```

---

## 🖥 Dashboard Structure

The dashboard follows a three-layer analytical structure:

### 1️⃣ Executive KPI Summary

* Total Production
* Downtime %
* Defect Rate %
* OEE %

### 2️⃣ Trend Analysis

* Production Trend (Date-wise)
* Downtime Trend (Date-wise)

### 3️⃣ Operational Breakdown

* Machine-wise Production
* Shift-wise Defect Rate

Interactive Filters:

* Production Date
* Machine ID
* Shift

---

## 🔍 Sample Business Insights

* Night shift exhibits slightly higher downtime percentage.
* Specific machines contribute disproportionately to defect rates.
* Overall OEE remains above 85%, indicating stable operational performance.
* Downtime ranges between 40–90 minutes per shift across machines.

---

## 🔗 Live Dashboard

👉 **View Dashboard Here:**
https://public.tableau.com/app/profile/abhivardhan.reddy.gopu5555/viz/OperationalKPIsDashboardwithTableau/Dashboard1?publish=yes

---

## 🎯 Project Objective

The objective of this task was to:

* Extract operational metrics from SQL Server
* Perform data cleaning and aggregation
* Build an interactive KPI dashboard in Tableau
* Enable root cause analysis using machine and shift filters

This project demonstrates competency in:

* SQL querying
* KPI design and calculation
* Data modeling
* Business analysis
* Executive dashboard design

---
