

-- Show all customer records
SELECT * FROM sales.customers;

-- Show total number of customers
SELECT COUNT(*) FROM sales.customers;

-- Show transactions for Chennai market (market code for chennai is Mark001
SELECT *
FROM sales.transactions ST 
INNER JOIN sales.markets SM
ON SM.markets_code = ST.market_code
WHERE SM.markets_name = 'Chennai';

-- Show distinct product codes that were sold in chennai
SELECT DISTINCT product_code
FROM sales.transactions;


-- Show transactions where currency is US dollars
SELECT *
FROM sales.transactions 
WHERE currency = 'USD';

-- Show transactions in 2020 join by date table 
SELECT ST.*
FROM sales.transactions ST 
INNER JOIN sales.date  SD 
ON ST.order_date = SD.date
WHERE SD.year = 2020;

-- Show total revenue in year 2020,
SELECT SUM(ST.sales_amount)
FROM sales.transactions ST 
INNER JOIN sales.date  SD 
ON ST.order_date = SD.date
WHERE SD.year = 2020;

 
--  Show total revenue in year 2020, January Month,
SELECT SUM(ST.sales_amount)
FROM sales.transactions ST 
INNER JOIN sales.date  SD 
ON ST.order_date = SD.date
WHERE SD.year = 2020
AND month_name = 'January';

-- Show total revenue in year 2020 in Chennai
SELECT SUM(ST.sales_amount)
FROM sales.transactions ST 
INNER JOIN sales.date  SD 
ON ST.order_date = SD.date
INNER JOIN sales.markets SM
ON SM.markets_code = ST.market_code
WHERE SD.year = 2020
AND SM.markets_name = 'Chennai';

-- remove null values  
select * FROM sales.markets;

-- remove 0 / -1 / and null 
SELECT * FROM sales.transactions where sales_amount < 1