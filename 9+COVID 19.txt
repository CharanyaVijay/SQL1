1.SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

2.SET @@sql_mode='ANSI';
SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) 
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

3.SET @@sql_mode='ANSI';
SELECT name, DAY(whn),
  confirmed- (LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)) as new
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

4.SET @@sql_mode='ANSI';
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed -(LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn))
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0 AND YEAR(whn) = 2020
ORDER BY whn

5.SET @@sql_mode='ANSI';
SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), 
 tw.confirmed - (LAG(tw.confirmed, 1) OVER (PARTITION BY tw.name ORDER BY tw.whn))
 FROM covid tw LEFT JOIN covid lw ON 
  DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
   AND tw.name=lw.name
WHERE tw.name = 'Italy'
and WEEKDAY(tw.whn) = 0
ORDER BY tw.whn

6.SET @@sql_mode='ANSI';
SELECT 
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) rc,
   deaths,
RANK() OVER (ORDER BY deaths DESC) rc
  FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC

7.SET @@sql_mode='ANSI';
SELECT 
   world.name,
   ROUND(100000*confirmed/population) as infect,
RANK() OVER (ORDER BY confirmed/population) rank
  FROM covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC

8.SET @@sql_mode='ANSI';
select name,DATE_FORMAT(whn,'%Y-%m-%d'),max(confirmed) from covid
where confirmed >1000
group by name,whn
