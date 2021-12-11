

--total death count per continent
CREATE VIEW DeathCountInContinent AS
SELECT continent, max(CAST (total_deaths AS int)) as total_death_count
FROM CovidDataProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
--we are excluding data that has no specified continent

--analysis on the data in which the continent is not specified
CREATE VIEW DeathCountNotInContinent AS
SELECT location, max(CAST (total_deaths AS int)) as total_death_count
FROM CovidDataProject..CovidDeaths
WHERE continent is null
GROUP BY location

 
--joining covid deaths with covid vaccinations
 SELECT * 
 FROM CovidDataProject..CovidVaccinations CV
 INNER JOIN CovidDataProject..CovidDeaths CD
 ON CV.location = CD.location
 AND CV.date = CD.date

 -- total vaccinations by continent
 SELECT CV.continent, MAX(CAST (CV.new_vaccinations AS int)) AS total_new_vaccinations
 FROM CovidDataProject..CovidVaccinations CV
 INNER JOIN CovidDataProject..CovidDeaths CD
 ON CV.location = CD.location
 AND CV.date = CD.date
 AND CV.continent IS NOT NULL
 GROUP BY CV.continent
 ORDER BY 2 DESC

 SELECT CD.date, CV.continent, CAST (CV.new_vaccinations AS INT) --total_new_vaccinations
 FROM CovidDataProject..CovidVaccinations CV
 INNER JOIN CovidDataProject..CovidDeaths CD
 ON CV.location = CD.location
 AND CV.date = CD.date
 AND CV.continent IS NOT NULL
 --GROUP BY CV.continent
 ORDER BY 1 DESC, 3 DESC



 