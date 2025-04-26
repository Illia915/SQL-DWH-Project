/*
quality checks
*/

-- Checking 'silver.crm_cust_info'

-- Checking for nulls or duplicates in primary key
select 
    cst_id,
    count(*) 
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null;

-- Checking for unwanted spaces
select 
    cst_key 
from silver.crm_cust_info
where cst_key != trim(cst_key);

-- Data standardization and consistency
select distinct 
    cst_marital_status 
from silver.crm_cust_info;

-- Checking 'silver.crm_prd_info'

-- Checking for nulls or duplicates in primary key
select 
    prd_id,
    count(*) 
from silver.crm_prd_info
group by prd_id
having count(*) > 1 or prd_id is null;

-- Checking for unwanted spaces
select 
    prd_nm 
from silver.crm_prd_info
where prd_nm != trim(prd_nm);

-- Checking for nulls or negative values in cost
select 
    prd_cost 
from silver.crm_prd_info
where prd_cost < 0 or prd_cost is null;

-- Data standardization and consistency
select distinct 
    prd_line 
from silver.crm_prd_info;

-- Checking for invalid date orders (start date > end date)
select 
    * 
from silver.crm_prd_info
where prd_end_dt < prd_start_dt;

-- Checking 'silver.crm_sales_details'

-- Checking for invalid dates
select 
    nullif(sls_due_dt, 0) as sls_due_dt 
from bronze.crm_sales_details
where sls_due_dt <= 0 
    or len(sls_due_dt) != 8 
    or sls_due_dt > 20500101 
    or sls_due_dt < 19000101;

-- Checking for invalid date orders (order date > shipping/due dates)
select 
    * 
from silver.crm_sales_details
where sls_order_dt > sls_ship_dt 
   or sls_order_dt > sls_due_dt;

-- Checking data consistency (sales = quantity * price)
select distinct 
    sls_sales,
    sls_quantity,
    sls_price 
from silver.crm_sales_details
where sls_sales != sls_quantity * sls_price
   or sls_sales is null 
   or sls_quantity is null 
   or sls_price is null
   or sls_sales <= 0 
   or sls_quantity <= 0 
   or sls_price <= 0
order by sls_sales, sls_quantity, sls_price;

-- Checking 'silver.erp_cust_az12'

-- Checking for out-of-range dates
select distinct 
    bdate 
from silver.erp_cust_az12
where bdate < '1924-01-01' 
   or bdate > getdate();

-- Data standardization and consistency
select distinct 
    gen 
from silver.erp_cust_az12;

-- Checking 'silver.erp_loc_a101'

-- Data standardization and consistency
select distinct 
    cntry 
from silver.erp_loc_a101
order by cntry;

-- Checking 'silver.erp_px_cat_g1v2'

-- Checking for unwanted spaces
select 
    * 
from silver.erp_px_cat_g1v2
where cat != trim(cat) 
   or subcat != trim(subcat) 
   or maintenance != trim(maintenance);

-- Data standardization and consistency
select distinct 
    maintenance 
from silver.erp_px_cat_g1v2;
