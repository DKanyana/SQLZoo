1.Winners from 1950
#Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

2.1962 Literature
#Show who won the 1962 prize for Literature.

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

3.Albert Einstein
#Show the year and subject that won 'Albert Einstein' his prize.

Select yr, subject
From nobel
Where winner = 'Albert Einstein'

4.Recent Peace Prizes
#Give the name of the 'Peace' winners since the year 2000, including 2000.

Select winner
From nobel
Where yr >=2000 AND subject = 'Peace'

5.Literature in the 1980's
#Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

Select yr, subject, winner
From nobel
Where subject = 'Literature' and yr between 1980 and 1989

6.Only Presidents
#Show all details of the presidential winners

SELECT * 
FROM nobel
WHERE winner in ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')

7.John
#Show the winners with first name John

Select winner
from nobel
Where winner like 'John%';

8.Chemistry and Physics from different years
#Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

select yr, subject, winner
from nobel
where (subject ='Physics' and yr=1980)
or (subject='Chemistry' and yr=1984);

9.Exclude Chemists and Medics
#Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

select yr, subject, winner
from nobel
where yr = 1980 and subject not in ('Chemistry','Medicine');

10.Early Medicine, Late Literature
#Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
#together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

select yr, subject, winner
from nobel 
where subject ='Medicine' and yr <1910 
or subject ='Literature' and yr >=2004;

Quiz **
#Show the amount of years where no Medicine awards were given

SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

Quiz**
#Show the year when neither a Physics or Chemistry award was given

SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

Quiz **
#Shows the years when a Medicine award was given but no Peace or Literature award was

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')
   
   
11.Umlaut - Mac Option+U followed by Shift+U **
#Find all details of the prize won by PETER GRÜNBERG

select * 
from nobel 
where winner = 'PETER GRÜNBERG'

12.Apostrophe
/*Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes
You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.*/

select * 
from nobel 
where winner = 'EUGENE O''NEILL';

13.Knights of the realm
#List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

select winner, yr, subject 
from nobel
where winner like 'Sir%'
order by yr desc;

14.Chemistry and Physics last
/*The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */

SELECT winner, subject,subject IN ('Physics','Chemistry')
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner
 
