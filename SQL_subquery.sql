SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

select name from world where (gdp/population)>(select gdp/population from world where name = 'United Kingdom') and continent='Europe'

select name,continent from world
where continent =(select continent from world where name ='Argentina') or continent =(select continent from world where name ='Australia')
order by name asc

select name,population from world
where population>(select population from world where name='Canada')
and population<(select population from world where name='Poland')

select name,CONCAT(ROUND((population/(select population from world where name='Germany')*100)),'%') as Percentage
from world where continent='Europe'

SELECT name
  FROM world
 WHERE gdp >= ALL(SELECT gdp
                           FROM world
                          WHERE continent='Europe' and gdp>0)
and continent <> 'Europe'

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)


SELECT continent,min(name)
from world
group by continent
//or in subquery way

SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent
          AND population>0)

SELECT name, continent, population 
FROM world w JOIN
     (SELECT continent
      FROM world
      GROUP BY continent
      HAVING max(pop) < 250000000
     ) c
     ON w.continent = c.continent;
