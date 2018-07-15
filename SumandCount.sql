/*
Aggregates ==
The functions SUM, COUNT, MAX and AVG are "aggregates", each may be applied to a numeric attribute resulting in a 
single row being returned by the query. 
(These functions are even more useful when used with the GROUP BY clause.)

Distinct ==
By default the result of a SELECT may contain duplicate rows. We can remove these duplicates using the DISTINCT key word.

Order by ==
ORDER BY permits us to see the result of a SELECT in any particular order. We may indicate ASC or DESC for ascending 
(smallest first, largest last) or descending order.

GROUP BY and HAVING ==

By including a GROUP BY clause functions such as SUM and COUNT are applied to groups of items sharing values. 
When you specify GROUP BY continent the result is that you get only one row for each different value of continent. 
All the other columns must be "aggregated" by one of SUM, COUNT ...

The HAVING clause allows use to filter the groups which are displayed. The WHERE clause filters rows before the aggregation, 
the HAVING clause filters after the aggregation.

If a ORDER BY clause is included we can refer to columns by their position.
*/

1.Total world population
#Show the total population of the world.

SELECT SUM(population)
FROM world

2.List of continents
#List all the continents - just once each.

SELECT DISTINCT continent
FROM world

3.GDP of Africa
#Give the total GDP of Africa

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

4.Count the big countries
#How many countries have an area of at least 1000000

SELECT COUNT(name)
FROM world
WHERE area>=1000000;

5.Baltic states population
#What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name in  ('Estonia', 'Latvia', 'Lithuania');

6.Counting the countries of each continent
#For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

7.Counting big countries in each continent
#For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
FROM world
WHERE population >=10000000
GROUP BY continent;

8.Counting big continents
#List the continents that have a total population of at least 100 million.

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)>100000000;

9.For each subject show the first year that the prize was awarded.

SELECT subject, min(yr)
FROM nobel
GROUP BY subject;

10.For each subject show the number of prizes awarded in the year 2000.

SELECT subject, count(winner)
FROM nobel
where yr =2000
GROUP BY subject;

11.Show the number of different winners for each subject.

SELECT subject, count(distinct winner)
FROM nobel
GROUP BY subject;

12.For each subject show how many years have had prizes awarded.

SELECT subject, count(distinct yr)
FROM nobel
GROUP BY subject;

13.Show the years in which three prizes were given for Physics.

select yr
from nobel
where subject = 'Physics'
group by yr
having count(winner)=3

14.Show winners who have won more than once.

select winner
from nobel
group by winner
having count(winner)>1

15.Show winners who have won more than one subject.

select winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT subject)>1

16.Show the year and subject where 3 prizes were given. Show only years 2000 onwards

SELECT yr,subject 
FROM nobel
WHERE yr>=2000
group by yr,subject
having count(winner)=3
