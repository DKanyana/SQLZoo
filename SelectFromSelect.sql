**
1.Bigger than Russia
#List each country name where the population is larger than that of 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2.Richer than UK
#Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select name
from world
where (gdp/population)>(Select (gdp/population) from world where name ='United Kingdom')
and continent = 'Europe'

3.Neighbours of Argentina and Australia
#List the name and continent of countries in the continents containing either Argentina or Australia. 
Order by name of the country.

select name, continent
from world
where continent = (select continent from world where name = 'Argentina')
or
continent = (select continent from world where name = 'Australia')
order by name

4.Between Canada and Poland
#Which country has a population that is more than Canada but less than Poland? Show the name and the population.

select name, population
from world
where population > (select  population from world where name = 'Canada')
and  population < (select  population from world where name = 'Poland');

5.Percentages of Germany ***
#Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

select name, CONCAT(ROUND(population/(select population from world where name ='Germany')*100),'%')
from world
where continent = 'Europe'

6.Bigger than every country in Europe
#Which countries have a GDP greater than every country in Europe? [Give the name only.] 
#(Some countries may have NULL gdp values)
/*
SET Operations - IN, ANY, ALL
IN - equals to any item in the list
ANY - compare value to each item in the list
ALL - compare value to all item in the list
<ANY - less the max in the list
>ANY - greater than minimum
=ANY - quivalent to IN
<ALL - less than minimum value in the list
>ALL - greater than maximum value in the list
*/

select name
from world
where gdp> ALL(select gdp from world where continent ='Europe' and gdp is not null)

7.Largest in each continent
#Find the largest country (by area) in each continent, show the continent, the name and the area
#We can refer to values in the outer SELECT within the inner SELECT. We can name the tables so that 
#we can tell the difference between the inner and outer versions.

#The above example is known as a correlated or synchronized sub-query. ***
/*A correlated subquery works like a nested loop: the subquery only has access to rows related to a single 
record at a time in the outer query. The technique relies on table aliases to identify two different uses of 
the same table, one in the outer query and the other in the subquery.

One way to interpret the line in the WHERE clause that references the two table is “… where the correlated values 
are the same”.
Performance - Correlated subquery performs better if outer or inner query returns less number of records else views 
or joins are better.

In the example provided, you would say “select the country details from world where the population is greater 
than or equal to the population of all countries where the continent is the same”.
SELECT continent, name, population FROM world x
  WHERE population >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent
          AND population>0)

*/

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

8.First country of each continent (alphabetically) ***
#List each continent and the name of the country that comes first alphabetically.

select continent, name 
from world x
where name <=ALL(select name from world y where x.continent = y.continent);

9.Find the continents where all countries have a population <= 25000000. ***
#Then find the names of the countries associated with these continents. Show name, continent and population.

select name, continent, population
from world x
where 25000000>=ALL(select population from world y where x.continent = y.continent and population>0)

10.Some countries have populations more than three times that of any of their neighbours (in the same continent). 
#Give the countries and continents.

select name, continent
from world x
where population >ALL(select population*3 from world y where x.continent = y.continent and population>0 and x.name!=y.name);

11.Quiz **
#Select the code that shows the name, region and population of the smallest country in each region

SELECT region, name, population FROM bbc x 
WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);

12.Quiz **
#Select the code that shows the countries belonging to regions with all populations over 50000

SELECT name,region,population FROM bbc x 
WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

13.Quiz **
#Select the code that shows the countries with a less than a third of the population of the countries around it

SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)
 
14.Quiz **
#Select the code that would show the countries with a greater GDP than any country in Africa 
#(some countries may have NULL gdp values).

SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
 
