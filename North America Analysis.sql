---ANALYSIS FOR NORTH AMERICA


--total cases vs population 
SELECT continent, location, population, (total_cases/population)*100
FROM CovidDataProject..CovidDeaths
where continent = 'North America'
AND location like '%states%'
order by 3 desc


--percentage of people who died in North America VS the percentage of people who got covid  in  North America

 --SELECT location FROM CovidDataProject..CovidDeaths
 --WHERE EXISTS(
SELECT CAST(date AS date), location, (total_deaths/population)*100 as death_percentage, (total_cases/population)*100 AS infection_rate
FROM CovidDataProject..CovidDeaths
WHERE continent = 'North America'
order by 3 desc
--) group by location


--In North America where are you most likely to contact covid 
--As of December 01 2021 youre  percent more likely to  contact Covid in...  compared to other places in North America

--comparing the two countries in north america with the highest death percentage 
SELECT CAST(date AS DATE) AS date, location, (total_deaths/population)*100 as death_percentage, (total_cases/population)*100 AS infection_rate
FROM CovidDataProject..CovidDeaths
WHERE  location in (SELECT location FROM CovidDataProject..CovidDeaths WHERE  continent = 'North America' group by location)
order by 1 desc, 3 desc




--death from infection in North America 
SELECT location, (total_deaths/total_cases)*100 as death_from_infection
FROM CovidDataProject..CovidDeaths
WHERE continent = 'North America'
ORDER BY 2 DESC
--Guatemala and NICARAGUA have the highest death from infection with 50%, in North America 
--As of december 2021, in Guatemala and Nicaragua you are 50% more likely to die from an infection

--Questions to Analyze 
--why do they have the highest death from infetion?


--countries with the highest infection rate by population in North America

SELECT max(population), location, MAX((total_cases/population)*100)
FROM CovidDataProject..CovidDeaths
WHERE continent = 'North America'
GROUP BY location
ORDER BY 3 DESC

--United States has the highest infection rate with 14%





--






