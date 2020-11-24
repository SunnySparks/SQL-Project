5 /*SUM and COUNT*/

Total world population
1.
Show the total population of the world.

world(name, continent, area, population, gdp)
SELECT SUM(population)
FROM world;


List of continents
2.
List all the continents - just once each.
SELECT DISTINCT continent
FROM world;


GDP of Africa
3.
Give the total GDP of Africa
SELECT SUM(gdp) FROM world WHERE continent = 'Africa';


Count the big countries
4.
How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world WHERE area > 1000000;


Baltic states population
5.
What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');



Using GROUP BY and HAVING
You may want to look at these examples: Using GROUP BY and HAVING.

Counting the countries of each continent
6.
For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world GROUP BY continent;


Counting big countries in each continent
7.
For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world 
WHERE population >= 10000000 GROUP BY continent;


Counting big continents
8.
List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;


/*QUIZ 5*/

1. Select the statement that shows the sum of population of all countries in 'Europe'
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

2. Select the statement that shows the number of countries with population smaller than 150000
 SELECT COUNT(name) FROM bbc WHERE population < 150000

3. Select the list of core SQL aggregate functions
AVG(), COUNT(), MAX(), MIN(), SUM()

4. Select the result that would be obtained from the following code:
No result due to invalid use of the WHERE function

5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

6. Select the statement that shows the medium population density of each region
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

7. Select the statement that shows the name and population density of the country with the largest population
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

8. Pick the result that would be obtained from the following code:

Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710