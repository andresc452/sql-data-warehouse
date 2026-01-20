INSERT INTO silver.crm_cust_info (
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date)

SELECT 
    cst_id, -- 1
    cst_key, -- 2
    TRIM(cst_firstname) AS cst_firstname, -- 3 Remove Unwanted Spaces
    TRIM(cst_lastname) AS cst_lastname, -- 4 Remove Unwanted Spaces

    CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single' -- 5 Data Normalization & Standardization
         WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
         ELSE 'n/a' -- Handling Missing Data
    END cst_gndr, 

    CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female' -- 6 Data Normalization & Standardization
         WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
         ELSE 'n/a' -- Handling Missing Data
    END cst_gndr, 
    cst_create_date -- 7

FROM (
    SELECT -- 8 Remove Duplicates 
        *,
        ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM bronze.crm_cust_info
    WHERE cst_id IS NOT NULL
) t 
WHERE flag_last = 1 -- Data Filtering
