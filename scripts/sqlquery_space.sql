-- Check for Unwanted Spaces
-- Expectation: No Results 
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Data Standarization & Consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info