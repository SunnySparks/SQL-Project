2 /*SELECT from WORLD*/
Introduction
1.
Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world;


Large Countries
2.
How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population >= 200000000;


Per capita GDP
3.
Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, GDP/population AS per_capita_GDP from world 
WHERE population >= 200000000;


South America In millions
4.
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000 AS population_in_millions 
    FROM world 
    WHERE continent = 'South America';


France, Germany, Italy
5.
Show the name and population for France, Germany, Italy

SELECT name, population 
    FROM world 
    WHERE name IN ('France', 'Germany', 'Italy');


United
6.
Show the countries which have a name that includes the word 'United'
SELECT name 
FROM world WHERE name LIKE 'United%';


Two ways to be big
7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area 
    FROM world 
    WHERE area > 3000000 OR population > 250000000;


One or the other (but not both)
8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area 
    FROM world 
    WHERE area > 3000000 XOR population > 250000000;


Rounding
9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) 
    FROM world 
    WHERE continent = 'South America';


Trillion dollar economies
10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(GDP/population, -3) 
    FROM world 
    WHERE GDP > 1000000000000;


Name and capital have the same length
11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string

SELECT name,
       capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);


Matching name and capital
12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Dont include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.

SELECT name, capital
FROM world 
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;


All the vowels
13.
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They dont count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name lIKE'%e%' AND name lIKE '%i%' AND name lIKE '%o%'AND name lIKE '%u%' AND name NOT LIKE '% %';

/*QUIZ 2*/

1. Select the code which gives the name of countries beginning with U
SELECT name
  FROM world
 WHERE name LIKE 'U%'


2. Select the code which shows just the population of United Kingdom?
SELECT population
  FROM world
 WHERE name = 'United Kingdom'


3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
 SELECT continent 
   FROM world 
  WHERE 'name' = 'France'
'name' should be name


4. Select the result that would be obtained from the following code:
 SELECT name, population / 10 
  FROM world 
 WHERE population < 10000

Nauru	990


5. Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')


6. Select the code which would give two rows
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')


7. Select the result that would be obtained from this code:
SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000

Brazil
Colombia
