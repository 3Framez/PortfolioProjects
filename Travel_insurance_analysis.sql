--Create the necessary views 

use	Insurancedb	
go
CREATE VIEW UnclaimedInsurance_VW AS 
SELECT * 
FROM Insurancedb..travel_insurance
WHERE Claim = 'No'

use Insurancedb
CREATE VIEW ClaimedInsurance AS 
SELECT * 
FROM Insurancedb..travel_insurance
WHERE Claim = 'Yes'

SELECT * FROM Insurancedb..travel_insurance 


--TEMP TABLES 



--Grouping agencies by their agency types 
SELECT Agency_Type, Agency FROM Insurancedb..travel_insurance
GROUP BY Agency, Agency_Type
ORDER BY Agency_Type


--ranking agencies total_net sales from highest to lowest
SELECT Agency, ROUND(SUM(Net_Sales),3) AS Total_Net_Sales
FROM Insurancedb..travel_insurance
GROUP BY Agency
ORDER BY Total_Net_Sales DESC

--ranking agencies by their total commisions from highest to lowest
SELECT Agency, ROUND(SUM(Commision),3) AS Total_Commision
FROM Insurancedb..travel_insurance
GROUP BY Agency
ORDER BY Total_Commision DESC
--EPX is the highest selling agency but also has one of the lowest commisions 


--ranking travel destinations by their popularity
SELECT Destination, COUNT(*) AS Total_number_of_records
FROM Insurancedb..travel_insurance
GROUP BY Destination
ORDER BY Total_number_of_records DESC

--ranking travel destinations by their agency sales
SELECT  Agency, Destination, SUM(Net_Sales) AS Total_Sales
FROM Insurancedb..travel_insurance
GROUP BY Destination, Agency
ORDER BY Total_Sales DESC

--EPX: Top 10  Selling Destinations
SELECT  Destination, SUM(Net_Sales) AS Total_Sales
FROM Insurancedb..travel_insurance
WHERE Agency = 'EPX'
GROUP BY Destination
ORDER BY Total_Sales DESC
OFFSET 0 ROWS 
FETCH FIRST 10 ROWS ONLY;

--EPX: Bottom 10  Selling Destinations
SELECT  Destination, SUM(Net_Sales) AS Total_Sales
FROM Insurancedb..travel_insurance
WHERE Agency = 'EPX'
GROUP BY Destination
ORDER BY Total_Sales DESC
OFFSET 127 ROWS 
FETCH NEXT 10 ROWS ONLY;


--ranking products by their popularity 
SELECT Product_Name, COUNT(*) Total_number_of_products
FROM Insurancedb..travel_insurance
GROUP BY Product_Name
ORDER BY Total_number_of_products DESC


--ranking products by their sales 
SELECT COUNT(*) AS Total_Unit_Sold, Product_Name, ROUND(SUM(Net_Sales),3) Total_number_of_sales
FROM Insurancedb..travel_insurance
GROUP BY Product_Name
ORDER BY Total_number_of_sales DESC

--ranking each product by its highest and lowest cost
SELECT  Product_Name, MAX(Net_Sales) AS Highest_product_cost, MIN(Net_Sales) AS Lowest_product_cost
FROM Insurancedb..travel_insurance
GROUP BY Product_Name
ORDER BY 2 DESC


