/* =======================
   BASIC SQL PRACTICE
   ======================= */

-- Q1: Total number of orders
SELECT 
    COUNT(orderid) AS total_orders
FROM ele_store_tb;

-- Q2: List of unique channels
SELECT 
    DISTINCT channel
FROM ele_store_tb;

-- Q3: Count of unique channels
SELECT 
    COUNT(DISTINCT channel) AS total_unique_channels
FROM ele_store_tb;

-- Q4: Total number of cities
SELECT 
    COUNT(DISTINCT city) AS total_cities
FROM ele_store_tb;

-- Q5: Total cities by country
SELECT 
    country,
    COUNT(DISTINCT city) AS total_cities
FROM ele_store_tb
GROUP BY country;

-- Q6: Total number of products
SELECT 
    COUNT(DISTINCT productname) AS total_products
FROM ele_store_tb;

-- Q7: Total sales and total profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ele_store_tb;

-- Q8: Total sales by region and country
SELECT 
    region,
    country,
    SUM(sales) AS total_sales
FROM ele_store_tb
GROUP BY region, country
ORDER BY region;

-- Q9: Total order quantity by promotion name
SELECT 
    promotionname,
    SUM(orderqty) AS total_order_qty
FROM ele_store_tb
GROUP BY promotionname;

-- Q10: Total sales in Asia region
SELECT 
    SUM(sales) AS asia_sales
FROM ele_store_tb
WHERE UPPER(region) = 'ASIA';

-- Q11: Total profit in Asia region and India
SELECT 
    SUM(profit) AS total_profit
FROM ele_store_tb
WHERE UPPER(region) = 'ASIA'
  AND UPPER(country) = 'INDIA';

-- Q12: Total order quantity by manufacturer and product name
SELECT 
    manufacturer,
    productname,
    SUM(orderqty) AS total_order_qty
FROM ele_store_tb
GROUP BY manufacturer, productname;

-- Q13: Cities with total order quantity greater than 27
SELECT 
    city,
    SUM(orderqty) AS total_order_qty
FROM ele_store_tb
GROUP BY city
HAVING SUM(orderqty) > 27;

-- Q14: Total sales in China (Beijing)
SELECT 
    SUM(sales) AS total_sales
FROM ele_store_tb
WHERE UPPER(country) = 'CHINA'
  AND UPPER(city) = 'BEIJING';

-- Q15: Total sales for Asian Holiday Promotion
SELECT 
    SUM(sales) AS total_sales
FROM ele_store_tb
WHERE promotionname = 'Asian Holiday Promotion';

-- Q16: Total profit by Contoso, Ltd manufacturer
SELECT 
    SUM(profit) AS total_profit
FROM ele_store_tb
WHERE manufacturer = 'Contoso, Ltd';

-- Q17: Total sales and order quantity by product category
SELECT 
    productcategory,
    SUM(sales) AS total_sales,
    SUM(orderqty) AS total_order_qty
FROM ele_store_tb
GROUP BY productcategory;

-- Q18: Regions with total sales between 1057 and 26700
SELECT 
    region,
    SUM(sales) AS total_sales
FROM ele_store_tb
GROUP BY region
HAVING SUM(sales) BETWEEN 1057 AND 26700;

-- Q19: Total orders in Pittsfield city
SELECT 
    COUNT(orderid) AS total_orders
FROM ele_store_tb
WHERE UPPER(city) = 'PITTSFIELD';

-- Q20: Total sales and profit by region, country, and city
SELECT 
    region,
    country,
    city,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ele_store_tb
GROUP BY region, country, city;

-- Q21: Total unit cost and total price by category, subcategory, and manufacturer
SELECT 
    productcategory,
    productsubcategory,
    manufacturer,
    SUM(unitcost) AS total_unit_cost,
    SUM(price) AS total_price
FROM ele_store_tb
GROUP BY productcategory, productsubcategory, manufacturer;