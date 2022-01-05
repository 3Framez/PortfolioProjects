
--  VISUALS 

--Total Number of Agencies and their total product sales
SELECT Agency, COUNT(*) AS count_of_agencies, ROUND(SUM(Net_Sales)) AS Total_sales 
FROM `third-fire-329622.TraveInsuranceData.Travel_Insurance`
GROUP BY Agency
ORDER BY 2 DESC;


--Top 3 highest priced products in the EPX agency 
SELECT  COUNT(Product_Name) AS Amount_Of_Products, Product_Name, MAX(Net_Sales) AS Total_sales
FROM `third-fire-329622.TraveInsuranceData.Travel_Insurance`
WHERE Agency = 'EPX'
GROUP BY Product_Name
ORDER BY 3 DESC;


--Destinations that had the highest to lowest EPX products   
SELECT  Destination, SUM(Net_Sales) as Total_sales
FROM `third-fire-329622.TraveInsuranceData.Travel_Insurance`
WHERE Agency = 'EPX'
GROUP BY Destination 
ORDER BY 2 DESC;

--ranking the top 10 travel destinations by their EPX agency sales
SELECT  Agency, Destination, SUM(Net_Sales) AS Total_Sales
FROM `third-fire-329622.TraveInsuranceData.Travel_Insurance`
WHERE Agency = 'EPX'
GROUP BY Destination, Agency
ORDER BY Total_Sales DESC
LIMIT 10;

--ranking the bottom 10 travel destinations by their EPX agency sales
SELECT  Agency, Destination, SUM(Net_Sales) AS Total_Sales
FROM `third-fire-329622.TraveInsuranceData.Travel_Insurance`
WHERE Agency = 'EPX'
GROUP BY Destination, Agency
ORDER BY Total_Sales DESC
LIMIT 10 
OFFSET 10 


--VISUALS









