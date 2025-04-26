/*
quality checks
*/

-- Checking 'gold.dim_customers'

-- Checking for uniqueness of customer key
select 
    customer_key,
    count(*) as duplicate_count
from gold.dim_customers
group by customer_key
having count(*) > 1;

-- Checking 'gold.dim_products'

-- Checking for uniqueness of product key
select 
    product_key,
    count(*) as duplicate_count
from gold.dim_products
group by product_key
having count(*) > 1;

-- Checking 'gold.fact_sales'

-- Checking the data model connectivity between fact and dimensions
select * 
from gold.fact_sales f
left join gold.dim_customers c on c.customer_key = f.customer_key
left join gold.dim_products p on p.product_key = f.product_key
where p.product_key is null or c.customer_key is null;
