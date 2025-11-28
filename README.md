# dbt_movielens_project

## 🚀 Project Overview

This repository contains the dbt (data build tool) project for the **MovieLens Data Engineering ELT Pipeline**. 

The dbt project is responsible for the **Transformation (T)** layer of the ELT process. It connects to the **Snowflake** Data Warehouse, where it standardizes, cleans, and models the raw data loaded from the **Google Cloud Storage (GCS)** Data Lake. This ensures the data is clean, well-structured, and ready for downstream analytics and visualization in Power BI.

## ⚙️ Technologies Used

*   **dbt Cloud:** Used for development, testing, and scheduling the data transformation jobs.
*   **Snowflake:** The cloud data warehouse where all transformations are executed.
*   **Google Cloud Storage (GCS):** The source for the raw MovieLens and enriched web-scraped data.
*   **SQL (with Jinja templating):** Used for creating all models.
*   **GitHub:** Integrated with dbt Cloud for version control and CI/CD.

## 📦 Data Modeling Approach

The project utilizes a multi-layered, modular approach to data modeling, organized into three key directories:

### 1. `staging`
*   **Purpose:** Standardizes raw data and prepares it for core modeling.
*   **Materialization:** Models are materialized as **Views** to avoid unnecessary data duplication while providing a clean layer on top of the raw source tables.

### 2. `dim_modelling`
*   **Purpose:** Contains the core dimensional model, including **Fact** and **Dimension** tables.
*   **Structure:** Implements a star-schema-like design (e.g., `dim_movie`, `dim_genre`, `fact_ratings`) for efficient querying.

### 3. `mart`
*   **Purpose:** Contains aggregated, business-ready datasets tailored for specific reporting needs.
*   **Output:** These are the final, ready-to-use tables and views that directly feed into the **Power BI** visualization layer.
*   **Benefit:** Provides quick access to answers for key business questions without needing complex joins or transformations in the BI tool.

## ✨ Optimization

A key architectural decision was to adopt the **ELT (Extract, Load, Transform)** paradigm, specifically moving all complex logic to dbt:
*   **Centralized Cleaning:** All data cleaning, business logic, and complex transformations are handled within dbt models.
*   **Pure Visualization:** This ensures that Power BI is used *only* for pure visualization and report building, simplifying the BI layer and ensuring consistency across all reports.

## ☁️ Deployment and CI/CD

The dbt project is integrated with dbt Cloud for continuous integration and deployment:
*   **DEV Environment:** Set up for isolated development, testing, and validation of new models.
*   **Production Environment:** Scheduled to run from the **main** branch of this GitHub repository, ensuring that only validated, production-ready code is run against the warehouse.
*   **Scheduling:** dbt Cloud scheduling is used to manage recurring data update runs.

---
**N.B. 
A Python scraping solution was developed to enrich the movie data:** Check it here https://github.com/BlessingAyewa/movielens-web-scraping
