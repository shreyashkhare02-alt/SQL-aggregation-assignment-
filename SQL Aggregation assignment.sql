use world;

show tables;

SELECT * FROM  country;
SELECT * FROM  city;
SELECT * FROM countrylanguage;

----- Question 1 : Count how many cities are there in each country?
SELECT CountryCode, COUNT(*)
FROM City
GROUP BY CountryCode;

----- Question 2 : Display all continents having more than 30 countries ?

SELECT Continent, COUNT(*) AS CountryCount
FROM Country
GROUP BY Continent
Having COUNT(*) > 30;

----- Question 3 : List regions whose total population exceeds 200 million.?
SELECT Region, SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;

----- Question 4 : Find the top 5 continents by average GNP per country.?

SELECT Continent, AVG(GNP) AS AvgGNP
FROM Country
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;

----- Question 5 : Find the total number of official languages spoken in each continent.?

SELECT c.Continent, COUNT(DISTINCT cl.Language) AS OfficialLanguages
FROM Country 
JOIN CountryLanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

----- Question 6 : Find the maximum and minimum GNP for each continent.?
SELECT Continent, 
       MAX(GNP) AS MaxGNP, 
       MIN(GNP) AS MinGNP
FROM Country
GROUP BY Continent;

----- Question 7 : Find the country with the highest average city population.?

SELECT c.Name AS Country, AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci 
ON c.countryCode = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

----- Question 8 : List continents where the average city population is greater than 200,000. ?

SELECT c.Continent, AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci 
ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

----- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life 
------ expectancy descending ?

SELECT Continent, 
       SUM(Population) AS TotalPopulation, 
       AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;

----- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where 
 ---- the total population is over 200 million.?

SELECT Continent, 
       SUM(Population) AS TotalPopulation, 
       AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC
LIMIT 3;













