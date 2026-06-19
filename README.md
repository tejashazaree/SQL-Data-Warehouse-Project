

# GlobalStoreDW: SQL Data warehouse Project

## 📌 Project Overview
This project demonstrates an end-to-end Data warehouse modeling using **SQL Server database lifecycle** and **VS Code**, version control, and automated **CI/CD pipelines**. It implements a star schema data warehouse designed for sales data analysis.

## 🛠 Tech Stack
*   **SQL Server**: Target data warehouse.
*   **VS Code**: Development environment with the **SQL Database Projects** extension.
*   **GitHub Actions**: Automation for CI/CD.
*   **.NET SDK & SQLPackage**: Tools for building and deploying `.dacpac` files.

---

## 🚀 Step-by-Step Implementation

### 1. Data Identification & Staging
The process begins with raw sales data containing ~25 headers such as Row ID, Order ID, Customer ID, Sales, Profit etc.
*   **Staging**: Upload the raw CSV data into a staging table within MS SQL Server to prepare for transformation.
SET DATEFORMAT dmy;
GO

```
SET DATEFORMAT dmy;
GO

BULK INSERT [dbo].[Stag_Orders]
FROM 'd:\Home\Tejas\OneDrive\Projects\SQL-Data-Warehouse-Project\GlobalStoreDW\Seed_data\Data\global_superstore_2016.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n' -- This handles standard web/linux line breaks (\n) safely
);
```

### 2. Star Schema Data Modeling
Design the star schema by separating the staged data into specialized dimension and fact tables.
*   **dimCustomer**: Customer ID (PK), Customer Name, Segment.
*   **dimProduct**: Product ID (PK), Product Name, Category, Sub-Category.
*   **dimLocation**: Postal Code (PK), City, State, Country, Region, Market.
*   **FactOrders**: RowID (PK), and foreign keys linking to the dimensions, along with measures like Sales, Quantity, and Discount.

### 3. Schema-as-Code Development
Organize the database objects within the repository using the following structure:
*   `Tables/`: Contains `.sql` files for the Star Schema tables.
*   `Scripts/`: Utility scripts for data loading (`SeedData.sql`).
*   `GlobalStoreDW.sqlproj`: The project definition file for building the database.

### 4. Data Transformation & Loading
Develop scripts to move data from the staging area into the finalized star schema model.
*   **Normalization**: Ensure data is properly structured and duplicates are removed during the transfer.
*   **Constraints**: Apply **Primary Keys** and **Foreign Keys** to maintain referential integrity between `FactOrders` and the dimension tables.

### 5. Build and Deployment Lifecycle
Follow the DevOps workflow to manage changes:
1.  **Define Schema**: Add or update `.sql` files for tables and procedures.
2.  **Version Control**: Commit changes to Git and use feature branches for new developments.
3.  **Build**: Compile the SQL project into a deployment-ready `.dacpac` file.
4.  **Deploy**: Publish the `.dacpac` to the target SQL Server environment.
5.  **Populate**: Execute the data load scripts to move data from staging to the production schema.

### 6. CI/CD Automation
The project utilizes **GitHub Actions** (`.github/workflows/sql-deploy.yml`) to automate the lifecycle on every push.
*   Automatically restores NuGet packages and builds the `.sqlproj`.
*   Publishes the updated schema to the SQL Server using **sqlpackage**.
*   Performs database validation and unit checks before deployment.

---

## 📈 Key Benefits
*   **Audit Trail**: Every schema change is logged via Git commits.
*   **Collaboration**: Supports branching, merging, and peer reviews just like application code.
*   **Consistency**: Automation ensures that the star schema is deployed identically across development and production environments.

## 📜 License
This project is licensed under the MIT License.