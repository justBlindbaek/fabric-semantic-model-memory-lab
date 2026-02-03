# Fabric Semantic Model Memory Lab

This repository contains a complete, end-to-end reference implementation used to explore
**semantic model memory behavior in Microsoft Fabric and Power BI**.

The project is intentionally structured in **two phases**:

1. **Building a modeling-ready dataset** (data engineering, schema unification, validation)
2. **Shaping semantic models** (Import, Hybrid, Direct Lake) — added later

The first phase is the foundation and the focus of the initial blog post.
The second phase builds on top of it without changing the underlying data.

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