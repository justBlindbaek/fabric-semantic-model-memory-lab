# SQL – Semantic model surface

This folder contains T-SQL scripts that expose a semantic modeling surface
on top of the Delta tables produced by the notebooks.

These scripts are introduced in a **later blog post** focused on
semantic model design and memory optimization.

---

## Purpose

The SQL layer serves as a contract between:
- Data engineering (Delta tables)
- Semantic modeling (Power BI / Tabular)

Views are used instead of direct table access to:
- Enforce naming conventions
- Control column exposure
- Support multiple modeling scenarios
- Avoid rewriting large Delta tables

---

## Naming conventions

### Keys
- All relationship keys are prefixed with `ID_`
- Key names are identical in fact and dimension views

### Measures
- All measure columns are prefixed with `M_`

### Schemas
- `dim` for dimension views
- `fct` for fact views

---

## Fact views

- `fct.YellowTaxi`
  - Intended for baseline semantic models

---

## Dimension views

Dimension views provide clean, role-ready entities such as:
- Date
- Time
- Taxi Zone
- Vendor
- Rate Code
- Payment Type

Unknown members are explicitly included to preserve referential integrity.

---

## Execution order

Run the scripts in the following order:

1. `schemas/dim.sql`
2. `schemas/fct.sql`
3. Dimension views in `dim_views/`
4. Fact views in `fct_views/`

The schemas must exist before creating views.
Dimension views should be created before fact views to support referential integrity.

---

## Design notes

- Views are intentionally stable
- Semantic models can be rebuilt without touching data
- Multiple models can coexist over the same dataset