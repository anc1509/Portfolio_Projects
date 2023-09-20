select * from covid.coviddeaths
where continent is not null;


SELECT location, date, total_cases, total_deaths, population FROM covid.coviddeaths
order by location;
-- total cases vs total deaths --
SELECT location, date, total_cases, total_deaths, population, (total_deaths/total_cases)*100
FROM covid.coviddeaths
where location like '%india%'
order by location;
-- Show likelihood of dying if you contracted covid in you countrt --
SELECT location, date, total_cases, total_deaths, population, (total_cases/ population)*100 as Infected_rate;
-- Looking at the country with highest infection rate compared popultation --
SELECT location, population, max(total_cases) as highest_infected, max((total_cases/ population)*100)as Infected_rate
FROM covid.coviddeaths
group by location, population
order by infected_rate desc ;
-- Showing countries with highest death per count population --
select location, max(total_deaths) as death_count
-- 
from covid.coviddeaths
group by location
order by death_count desc;

-- let's break down by continent --
select continent, max(total_deaths )
from covid.coviddeaths
where continent is not null
group by continent;

-- Showing continent with highest death rate per population count --
select continent, (sum(total_deaths)/sum(population))*100 as death_percentage
from covid.coviddeaths
group by continent
order by death_percentage desc;

-- Total covid data country wise --
select *
from covid.coviddeaths d 
join covid.covidvaccinations v
on d.location = v.location
and d.date = v.date
where d.continent is not null
order by 1,2,3


