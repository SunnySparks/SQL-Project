1 /*SELECT Basics*/
1.
The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany'

2.
Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

3.
Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/*QUIZ 1*/
1. Select the code which produces this table
name	population
Bahrain	1234571
Swaziland	1220000
Timor-Leste	1066409

SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

2. Pick the result you would obtain from this code:
      SELECT name, population
      FROM world
      WHERE name LIKE "Al%"

Table-E
Albania	3200000
Algeria	32900000

3. Select the code which shows the countries that end in A or L

SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

4. Pick the result from the query
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'

name	length(name)
Italy	5
Malta	5
Spain	5

5. Here are the first few rows of the world table:
name	region	area	population	gdp
Afghanistan	South Asia	652225	26000000	
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	
...
Pick the result you would obtain from this code:
SELECT name, area*2 FROM world WHERE population = 64000

Andorra	936

6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

 7. Select the code that shows the population density of China, Australia, Nigeria and France

 SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

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



3 /*SELECT from Nobel Tutorial*/


Winners from 1950
1.
Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;


1962 Literature
2.
Show who won the 1962 prize for Literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';


Albert Einstein
3.
Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';


Recent Peace Prizes
4.
Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace';


Literature in the 1980s
5.
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner 
FROM nobel 
WHERE yr >= 1980 AND yr <= 1989 AND subject = 'Literature';


Only Presidents
6.
Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama
SELECT * FROM nobel
 WHERE subject IN ('Peace') AND yr IN (2009, 2002, 1919, 1906);


John
7.
Show the winners with first name John
SELECT winner FROM nobel 
WHERE winner LIKE 'John%';


Chemistry and Physics from different years
8.
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT yr, subject, winner FROM nobel 
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;



Exclude Chemists and Medics
9.
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT yr, subject, winner FROM nobel 
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');


Early Medicine, Late Literature
10.
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner FROM nobel 
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;



Harder Questions
Umlaut
11.
Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel 
WHERE winner LIKE 'PETER GR%';


Apostrophe
12.
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes
You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.
SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL';



Knights of the realm
13.
Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%';



Chemistry and Physics last
14.
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY SUBJECT IN ('Physics', 'Chemistry'),subject,winner;


/*QUIZ 3*/

1. Pick the code which shows the name of winners names beginning with C and ending in n
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'


2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960


3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')


4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet


5. Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))


6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')


7. Pick the result that would be obtained from the following code:
 SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
  GROUP BY subject
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1

4 /*SELECT within SELECT Tutorial*/
Bigger than Russia
1.
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp)
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')


Richer than UK
2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Per Capita GDP
The per capita GDP is the gdp/population
SELECT name FROM world WHERE gdp/population >
(SELECT gdp/population FROM world
      WHERE name='United Kingdom') AND continent = 'Europe';


Neighbours of Argentina and Australia
3.

List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world 
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
OR continent = (SELECT continent FROM world WHERE name = 'Australia') 
ORDER BY name;

Between Canada and Poland
4.
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland');


Percentages of Germany
5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:
name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world 
WHERE name = 'Germany'), 0), %)
FROM world
WHERE continent = 'Europe';


Bigger than every country in Europe
6.
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE gdp >= ALL(SELECT gdp FROM world WHERE gdp >=0 AND continent = 'Europe') 
AND continent != 'Europe';


Largest in each continent
7.
Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
    WHERE y.continent=x.continent
    AND area>0)


First country of each continent (alphabetically)
8.
List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)


Difficult Questions That Utilize Techniques Not Covered In Prior Sections
9.
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world 
WHERE population <= 25000000 AND continent = 'Caribbean';



10.
Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
FROM world x
WHERE population > ALL(SELECT population*3 FROM world y 
WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)

/* QUIZ 4 */

1. Select the code that shows the name, region and population of the smallest country in each region
 SELECT region, name, population FROM bbc x 
 WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region 
 AND population>0)


2. Select the code that shows the countries belonging to regions with all populations over 50000
 SELECT name,region,population FROM bbc x 
 WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)


3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)


4. Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')


Table-D
France
Germany
Russia
Turkey

5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')


6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')


7. >Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia'

Table-B
Bangladesh
India
Pakistan

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
