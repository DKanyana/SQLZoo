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

SELECT * FROM nobel
 WHERE winner in ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
 
