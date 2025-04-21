DROP TABLE IF EXISTS bronze.crm_customer_inf;
create table bronze.crm_customer_inf
(
  cst_id int,
  cst_key varchar(50),
  cst_firstname varchar(50), 
  cst_lastname varchar(50), 
  cst_materialstatus varchar(50), 
  cst_gender varchar(50),
  csr_createdate date
);


DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id        INT,         
    prd_key       TEXT,              
    prd_nm        TEXT,              
    prd_cost      NUMERIC,           
    prd_line      VARCHAR(50),           
    prd_start_dt  DATE,             
    prd_end_dt    DATE              
);


DROP TABLE IF EXISTS bronze.crm_sls_info;
CREATE TABLE bronze.crm_sls_info (
    sls_ord_num    VARCHAR(50),             
    sls_prd_key    VARCHAR(50),              
    sls_cust_id    INT,          
    sls_order_dt   INT,             
    sls_ship_dt    INT,             
    sls_due_dt     INT,          
    sls_sales      INT,         
    sls_quantity   INT,           
    sls_price      INT            
);


DROP TABLE IF EXISTS bronze.erp_cust_az12;
create table bronze.erp_cust_az12
(
  cid varchar(50),
  bdate date,
  gen varchar(50)
);


DROP TABLE IF EXISTS bronze.erp_loc_101;
create table bronze.erp_loc_101
(
  cid varchar(50),
  cntry varchar(50)
);


DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2
(
  id varchar(50),
  cat varchar(50),
  subcat varchar(50),
  maintaenance varchar(50)
);
