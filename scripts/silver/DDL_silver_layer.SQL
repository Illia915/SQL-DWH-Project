--Tests for not uniqye primary key
select 
prd_id,
count(*) 
from  bronze.crm_prd_info
group by prd_id 
having count(*) > 1 or prd_id is null

--Searching for spaces in f_name,L_name
select 
prd_cost
from bronze.crm_prd_info
where prd_cost < 0 or prd_cost is NUll

select * from bronze.crm_prd_info limit 2

select 
cst_firstname 
from silver.crm_customer_info
where cst_lastname != trim(cst_lastname) 


-- Tests for silver.crm_sls_info
-- check the spaces
select
*
from bronze.crm_sls_info
where sls_ord_num != trim(sls_ord_num)

--check the date type issue
select
* 
from bronze.crm_sls_info
where sls_due_dt = 0 or length(sls_due_dt::varchar) != 8

-- CHECK THE SALES DETAIL
-- RULE 1 SALES = QUANTITY * sls_price
-- RULE 2 SALES MUST NOT CONTAIN (NULL, 0, NEGATIVE)

select
sls_sales,
sls_quantity,
sls_price
from silver.crm_sls_info
where sls_sales != sls_quantity * sls_price 
or sls_sales is null
or sls_quantity is null
or sls_price is null
order by sls_price


--tests for silver.erp_cust_az12

--check the user which born more than 100 years ago or in the future 
select 
distinct "BDATE"
from bronze.erp_cust_az12
where "BDATE" < '1925-04-24' or "BDATE" > current_date

--Tests for silver.erp_loc_a101

--check the valid data in CNTRY
select * from bronze.erp_loc_101
select 
distinct "CNTRY"
from bronze.erp_loc_101


--Tests for silver.erp_px_cat_g1v2
select * from bronze.erp_px_cat_g1v2 limit 100

select 
distinct "MAINTENANCE"
from bronze.erp_px_cat_g1v2
where "CAT" != trim("CAT")
