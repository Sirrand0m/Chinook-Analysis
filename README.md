# 🎵 Chinook Digital Music Store — End-to-End Analysis

An end-to-end data analysis project exploring 5 years of sales data (2009–2013) from the Chinook digital music store. The goal was to assess business performance, identify growth opportunities, and surface actionable recommendations.

---

## 📊 Dashboard

👉 [View the interactive Tableau dashboard here](https://public.tableau.com/views/Dashboard_17784494916090/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## 🛠 Tools & Technologies

| Tool | Purpose |
|------|---------|
| **SQLite** | Querying and extracting data from the Chinook database |
| **Tableau Public** | Interactive visualisations and dashboard |

---

## 📁 Project Structure

```
Chinook-Analysis/
│
├── 01_raw_data/      # SQLite file used to generate the Chinook database
├── 02_sql/           # SQL queries used for analysis
├── 03_exports/       # Exported data for use in Tableau
├── 04_tableau/       # Tableau workbook file
├── 05_report/        # Business report and personal reflection
└── README.md
```

---

## 🔍 Analysis Overview

The analysis covered several key business dimensions:

- **Revenue trends** — Monthly revenue patterns over 5 years
- **Genre performance** — Identifying top-selling music genres
- **Album performance** — Best-selling albums by total sales
- **Customer insights** — Top customers by lifetime spend
- **Geographic revenue** — Revenue breakdown by country

---

## 📌 Key Findings

- **Revenue is flat** — Monthly revenue holds steady around $37.62 with occasional peaks and dips, indicating a stable but stagnant business with no clear growth trajectory.
- **Rock dominates** — The Rock genre accounts for more than double the sales of the next best-performing genre (Latin).
- **TV soundtracks drive album sales** — 6 of the top 10 albums by sales are TV show soundtracks.
- **USA leads in revenue** — The US generates the highest revenue, followed by Canada and France.
- **High-value solo customers** — 4 of the top 10 customers by spend are each the sole customer from their country (Chile, Hungary, Ireland, Austria), suggesting untapped markets.

---

## ✅ Recommendations

1. **Double down on Rock & TV soundtracks** — These are the top-performing track and album categories. Targeted marketing here should help drive incremental sales.

2. **Increase marketing in the USA** — A disproportionate share of top customers come from the US, suggesting higher purchase intent and willingness to spend.

3. **Explore new markets** — Chile, Hungary, Ireland, and Austria each have a single high-value customer. Feasibility studies in these countries could reveal lucrative expansion opportunities.

---

## 🗄 About the Dataset

The [Chinook database](https://github.com/lerocha/chinook-database) is a sample database representing a digital media store, including tables for artists, albums, tracks, invoices, and customers. It is widely used for practising SQL and data analysis.
