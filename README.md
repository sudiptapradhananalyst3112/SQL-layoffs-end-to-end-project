# 📉 World Layoffs: End-to-End SQL Project (Cleaning + EDA)

![MySQL](https://shields.io)
![SQL](https://shields.io)
![Data Analysis](https://shields.io)

## 📌 Project Overview
This project showcases an end-to-end data pipeline using **MySQL** on a real-world dataset detailing global tech industry layoffs. The project is split into two phases:
1. **Data Cleaning:** Transforming a messy, unformatted raw dataset into a structured, production-ready environment.
2. **Exploratory Data Analysis (EDA):** Writing complex analytical queries to extract actionable business insights, uncover macroeconomic trends, and track the progression of layoffs over time.

---

## 🛠️ Tech Stack & Advanced SQL Concepts Used
* **Database Platform:** MySQL Server
* **Advanced Aggregations & Groupings:** Extracted multi-level insights across companies, industries, countries, and time horizons.
* **Window Functions:** Employed `DENSE_RANK()` for structural ranking and `SUM() OVER()` for advanced time-series calculations.
* **Common Table Expressions (CTEs):** Used multi-layered CTEs to isolate complex calculations and calculate rolling metrics cleanly.
* **String & Date Parsing:** `SUBSTRING()`, `YEAR()`, and type conversions for granular time series handling.

---

## 📊 Phase 1: Data Cleaning Highlights
Before analyzing, the data was rigorously cleaned to prevent flawed business intelligence reporting:
* **De-duplication:** Isolated and purged multi-column duplicates via a `ROW_NUMBER()` window function partitioned environment.
* **Standardization:** Fixed text fragmentation (e.g., merging structural discrepancies under `'crypto'`) and trimmed trailing whitespaces.
* **Data Type Modifications:** Altered text string metrics to standard database `DATE` attributes.
* **Null Handling:** Executed self-joins to inherit missing industrial attributes and removed unrecoverable empty metrics.

*See the full cleaning file here:* [`Scripts/1_data_cleaning.sql`](#)

---

## 🔍 Phase 2: Exploratory Data Analysis & Insights
Using the structured dataset, I built analytical queries to uncover critical trends:

### 1. Macro & Industry-Wide Impacts
* **Top Companies Hit:** Aggregated absolute metrics to rank companies by the sheer volume of global workforce reductions.
* **Sector Vulnerability:** Evaluated structural impact across industries to pinpoint which sectors faced the most aggressive down-scaling.
* **Geographical Distribution:** Grouped records globally to see which nations experienced the heaviest operational impact.

### 2. Time-Series & Progress Analysis
* **Temporal Spikes:** Tracked monthly global layoff spikes by parsing dates with `SUBSTRING()` to analyze year-over-year trends.
* **Rolling Growth Analytics:** Built a **Rolling Total Calculation** using a multi-step CTE and a running sum window function to track cumulative job losses over the entire timeline.

### 3. Advanced Annual Company Rankings
* Implemented a **DENSE_RANK() Window Function** combined with nested CTEs to isolate and rank the **Top 5 Companies with the highest layoffs for each individual calendar year**, revealing shifts in economic pressure across different stages of the timeline.

*See the full exploration script here:* [`Scripts/2_exploratory_data_analysis.sql`](#)

---

## 💡 Key Skills Demonstrated
1. **Data Governance & Integrity:** Creating secure staging environments to shield raw data records during processing.
2. **Business Intelligence Mindset:** Moving past basic querying to track complex trends like rolling metrics and annual structural changes.
3. **Optimized SQL Writing:** Designing clean, human-readable CTE chains that execute complex logic smoothly.
