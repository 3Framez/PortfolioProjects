--COVID-19 PROJECTIONS IN CANADA 

SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS total_of_new_cases_in_november, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YYYY, date) = 2021
AND DATEPART(MM, date) = 11
AND location = 'Canada';
--October
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS total_of_new_cases_in_october, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YYYY, date) = 2021
AND DATEPART(MM, date) = 10
AND location = 'Canada';
--September
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS total_of_new_cases_in_september, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YYYY, date) = 2021
AND DATEPART(MM, date) = 09
AND location = 'Canada';
--August
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS total_of_new_cases_in_august, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YYYY, date) = 2021
AND DATEPART(MM, date) = 08
AND location = 'Canada';
--July
SELECT  MAX(total_cases) AS total_cases_in_2021, MAX(new_cases) AS total_new_cases_in_july, (MAX(new_cases)/MAX(total_cases))*100 AS case_percentage
FROM CovidDataProject..CovidDeaths
WHERE DATEPART (YYYY, date) = 2021
AND DATEPART(MM, date) = 07
AND location = 'Canada';

--this shows the number of cases increased from july to september but decreased from september to november 
--september had the highest number of cases

--FURTHER ANALYSIS ON CASES/DEATHS IN SEPTEMBER 

--CALCULATE THE RUNNING TOTAL OF PEOPLE VACCINATED IN CANADA PER DAY IN THE MONTH OF SEPTEMBER 
SELECT CD.population, CD.date,  SUM(CV.new_vaccinations) OVER ( ORDER BY CV.date) AS running_total_of_people_vaccinated
 FROM CovidDataProject..CovidVaccinations CV
 INNER JOIN CovidDataProject..CovidDeaths CD
 ON CV.location = CD.location
 AND CV.date = CD.date
 AND CV.location = 'Canada'
 AND DATEPART(YYYY, CD.date) = 2021
 AND DATEPART(MM, CD.DATE) in (09)

 --calculate the running total of % of death by population per day from september to december 

 


 

  SELECT distinct date, SUM(CONVERT(int,new_deaths)) OVER (order by date) AS running_total_of_new__deaths
 FROM CovidDataProject..CovidDeaths
 WHERE DATEPART(YYYY, date) = 2021
 AND DATEPART(MM, date) = 09
 --OR DATEPART(MM, date) = 10
 ORDER BY 1, 2 asc



 








 
 

 -- shows the relationship between the newly vaccinated/infected/deceased 
 --shows the percentage of people that died from new infections in the month of september
--CREATE VIEW DeathVSCasesVSVaccines AS
 WITH DeathVSCasesVSVaccines (population, date,  running_total_of_people_vaccinated,  running_total_of_new_deaths,  running_total_of_new_cases)
 AS(
 SELECT CD.population, CD.date,  SUM(CV.new_vaccinations) OVER ( ORDER BY CV.date) AS running_total_of_people_vaccinated,
 SUM(CONVERT(int, CD.new_deaths)) OVER (ORDER BY CD.date)  AS running_total_of_new_deaths,
 SUM(CD.new_cases) OVER (ORDER BY CD.date)  AS running_total_of_new_cases
 FROM CovidDataProject..CovidVaccinations CV
 INNER JOIN CovidDataProject..CovidDeaths CD
 ON CV.location = CD.location
 AND CV.date = CD.date
 AND CV.location = 'Canada'
 AND DATEPART(YYYY, CD.date) = 2021
 AND DATEPART(MM, CD.DATE) in (09)
 )SELECT *, (running_total_of_new_deaths/population)*100 AS newly_deceased_percentage
		, (running_total_of_people_vaccinated/population)*100  AS newly_vaccined_percentage
		,(running_total_of_new_cases/population)*100  AS newly_infected_percentage
		,(running_total_of_new_deaths/running_total_of_new_cases)*100 AS newly_deceased_from_infection_percentage
		,(running_total_of_new_deaths/running_total_of_people_vaccinated)*100 AS vaccines_effectivenes_on_deaths

 FROM DeathVSCasesVSVaccines;

 --in the month of september only 7 percent of the entire population were newly vaccinated
 -- from the 1st of september to the 6th, there was a consistent decrease. This shows causation, meaning the vaccines were effective for a few days
 --the new deaths from new infections was at its highest on the 1st of september and gradually decreased until the 7th, 
 -- from the 7th of september it fluctuated between rise and fall till the 28th, and then shot back up 

 ALTER TABLE CovidDataProject..CovidVaccinations
 ALTER COLUMN new_vaccinations float


 --TEMP TABLE

 DROP TABLE IF EXISTS
 CREATE TABLE #VaccinatedPercentage
 (
 Date datetime,
 Population numeric,
 New_Deaths  numeric,
 New_Vaccinations  numeric,
 New_Cases  numeric,
 running_total_of_people_vaccinated numeric,
 ) 
 INSERT INTO #VaccinatedPercentage 
 
 SELECT CD.population, CD.date,  SUM(CV.new_vaccinations) OVER ( ORDER BY CV.date) AS running_total_of_people_vaccinated,
 SUM(CONVERT(int, CD.new_deaths)) OVER (ORDER BY CD.date)  AS running_total_of_new_deaths,
 SUM(CD.new_cases) OVER (ORDER BY CD.date)  AS running_total_of_new_cases
 FROM CovidDataProject..CovidVaccinations CV
 INNER JOIN CovidDataProject..CovidDeaths CD
 ON CV.location = CD.location
 AND CV.date = CD.date
 AND CV.location = 'Canada'
 AND DATEPART(YYYY, CD.date) = 2021
 AND DATEPART(MM, CD.DATE) in (09)


 SELECT *, running_total_of_people_vaccinated/Population  FROM #VaccinatedPercentage
