-- Check for Nulls or Duplicates in Primary Key
-- Expectation: No Result

SELECT
    cst_id,
    COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- Check for Unwanted Spaces
-- Expectation: No Results 
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Data Standarization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

-- Check for Invalid Date Orders
SELECT *
FROM bronze.crm_prd_info

SELECT * FROM silver.crm_cust_info
