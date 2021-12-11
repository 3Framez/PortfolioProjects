--Further analysis on GUATEMALA AND NICARAGUA

--FURTHER ANALYSIS INTO GUATEMALA 


-- infection rate in Guatemala . The US has the highest infection rate in North America with 14.6% compared to Guatemala's 3.38%
SELECT max(population) highest_population, location, MAX((total_cases/population)*100) infection_rate, MAX((total_deaths/total_cases))*100 death_from_infection
FROM CovidDataProject..CovidDeaths
WHERE location = 'Guatemala'
OR location = 'Nicaragua'
OR location = 'United States'
GROUP BY location
ORDER BY 3 DESC;
--Although the US has a higher infection rate than Guatemala and Nicaragua, the death from infection isn't as bad as the rest

-- comparing the percentage increase in new cases over the past 5 months (November to July)

--November
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS MAX_of_new_cases_in_november, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YY, date) = 2021
AND DATEPART(MM, date) = 11
AND location = 'Guatemala';
--October
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS MAX_of_new_cases_in_october, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YY, date) = 2021
AND DATEPART(MM, date) = 10
AND location = 'Guatemala';
--September
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS MAX_of_new_cases_in_september, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YY, date) = 2021
AND DATEPART(MM, date) = 9
AND location = 'Guatemala';
--August
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS MAX_of_new_cases_in_august, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YY, date) = 2021
AND DATEPART(MM, date) = 8
AND location = 'Guatemala';
--July
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS MAX_of_new_cases_in_july, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YY, date) = 2021
AND DATEPART(MM, date) = 7
AND location = 'Guatemala';

--conclusion
--From july to August there was an increase in the number of cases. From August ot November there has been a consistent decrease in the number of cases


-- in Belize there was a spike in increase of the number of cases from july to august and then a significant decrease from october to november