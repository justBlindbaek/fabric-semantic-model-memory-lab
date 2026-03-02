# Fabric Semantic Model Memory Lab

This repository contains a complete, end-to-end reference implementation used to explore
**semantic model memory behavior in Microsoft Fabric and Power BI**.

The project is intentionally structured in **two phases**:

1. **Building a modeling-ready dataset** (data engineering, schema unification, validation)
   — [Blog post](https://justb.dk/blog/2026/02/building-a-fabric-lab-for-semantic-model-memory-experiments-with-help-from-chatgpt/)
2. **Shaping semantic models** (Import, Hybrid, Direct Lake)
   — Blog post coming

The first phase covers the full data pipeline from raw ingestion to a modeling-ready schema.
The second phase adds semantic models on top of that data without changing the underlying tables.
The initial model is already in this repo — the blog post will follow.

---

## Project goals

This repository is designed to:

- Demonstrate how real-world data evolves over time
- Show how schema drift complicates analytics
- Create a large, intentionally “imperfect” dataset
- Enable controlled experiments with semantic model memory usage
- Support a blog series about VertiPaq, Direct Lake, and modeling trade-offs

Several design choices in this repo are **deliberately suboptimal** from a pure modeling
perspective. This is intentional and documented.

---

## Dataset

The source data is the **NYC TLC Yellow Taxi Trip Records** covering the years **2009–2025**.

Characteristics of the dataset:
- Schema changes across years
- Missing and newly introduced columns
- Legacy naming conventions
- Occasional data quality issues (e.g. out-of-range dates)

These characteristics make it ideal for demonstrating real-world modeling challenges.

---

## Repository structure

```text
models/
└── YellowTaxi/                        ← Tabular Editor "Save to folder" format
    ├── database.json
    └── tables/
        ├── Date/
        ├── Payment Type/
        ├── Rate Code/
        ├── Taxi Zone Dropoff/
        ├── Taxi Zone Pickup/
        ├── Time/
        ├── Vendor/
        └── Yellow Taxi/               ← Fact table with 5 partitions (2021–2025)

notebooks/
├── 01_ingest_data.ipynb
├── 02_unify_schema.ipynb
├── 03_transform_fact.ipynb
├── 04_transform_dimensions.ipynb

sql/
├── dim_views/
├── fct_views/
├── schemas/

README.md
```

---

## Semantic model

The `models/YellowTaxi/` folder contains the **YellowTaxi** semantic model stored in
[Tabular Editor "Save to folder" format](https://docs.tabulareditor.com/te3/features/save-to-folder.html),
making it version-control friendly.

### Schema overview

| Table | Type | Columns | Measures | Partitions |
|---|---|---|---|---|
| Yellow Taxi | Fact | 27 | 10 | 5 (2021–2025) |
| Date | Dimension | 19 | — | 1 |
| Time | Dimension | 10 | — | 1 |
| Vendor | Dimension | 2 | — | 1 |
| Payment Type | Dimension | 2 | — | 1 |
| Rate Code | Dimension | 2 | — | 1 |
| Taxi Zone Pickup | Dimension | 4 | — | 1 |
| Taxi Zone Dropoff | Dimension | 4 | — | 1 |

The fact table is partitioned by year to allow controlled experiments comparing
memory footprint and query performance across different partition strategies.

### Measures

The following base measures are defined on the fact table:

- Airport Fee, Congestion Surcharge, Extra, Fare Amount
- Improvement Surcharge, MTA Tax, CBD Congestion Fee
- Passenger Count, Tip Amount, Tolls Amount, Total Amount, Trip Distance