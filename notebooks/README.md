# Notebooks – Building the dataset

This folder contains the Fabric notebooks used to build a unified,
modeling-ready dataset from the NYC TLC Yellow Taxi Trip Records.

These notebooks are the focus of the **first blog post** in the series.

---

## Execution order

Run the notebooks in the following order:

1. `01_ingest_data.ipynb`
2. `02_unify_schema.ipynb`
3. `03_transform_fact.ipynb`
4. `04_transform_dimensions.ipynb`

Each notebook builds on the output of the previous one.

---

## 01_ingest_data.ipynb

Downloads the raw parquet files from the public TLC dataset and stores them
in OneLake using a Hive-style folder structure.

- No schema normalization
- No data cleansing
- Binary copy only

Purpose: preserve the raw data exactly as published.

---

## 02_unify_schema.ipynb

This is the most complex notebook in the pipeline.

It:
- Analyzes schema differences across years
- Normalizes column names and data types
- Handles missing and newly introduced columns
- Resolves legacy naming conventions
- Produces a single unified dataset spanning 2009–2025

This notebook documents the decisions required to turn heterogeneous,
evolving data into something that can be modeled.

---

## 03_transform_fact.ipynb

Builds a wide Gold fact table from the unified dataset.

The table intentionally includes:
- High-cardinality columns
- GUID-like identifiers
- String-heavy attributes
- Duplicate fields
- Unnecessary numeric precision

These choices are deliberate and used later to demonstrate
semantic model memory behavior.

---

## 04_transform_dimensions.ipynb

Creates supporting dimensions used by the semantic model:
- Date
- Time of Day
- Taxi Zone
- Vendor
- Rate Code
- Payment Type

Includes explicit handling of:
- Unknown / invalid values
- Referential integrity issues
- Real-world data quality anomalies

---

## Design notes

- The output of this folder is a **large but stable dataset**
- The data is intentionally not optimized for memory
- Later optimization happens at the semantic model layer