1)select count(*) from stops

2)select id from stops where name='Craiglockhart'

3)SELECT id, name
FROM stops
JOIN route
ON id = stop
WHERE num = '4' AND company = 'LRT';

4)SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*)>=2

5)SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b
ON a.company = b.company AND a.num = b.num
WHERE a.stop = 53 AND b.stop = 149;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b
ON  a.num = b.num
WHERE a.stop = 53 AND b.stop = 149;

6)SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
and stopb.name='London Road'

7)SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
where a.stop=115 and b.stop=137

8)select a.company,a.num
from route a join
route b on 
(a.company=b.company and a.num=b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
where stopa.name='Craiglockhart' 
and stopb.name='Tollcross'

9)select distinct stopb.name,a.company,a.num from 
route a join route b on
(a.company=b.company and a.num=b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
where stopa.name = 'Craiglockhart'

10)SELECT S.num, S.company, S.name, T.num, T.company 
FROM 
    (SELECT DISTINCT a.num, a.company, sb.name 
     FROM route a JOIN route b ON (a.num = b.num and a.company = b.company) 
                  JOIN stops sa ON sa.id = a.stop 
                  JOIN stops sb ON sb.id = b.stop 
     WHERE sa.name = 'Craiglockhart' AND sb.name <> 'Craiglockhart'
)S

JOIN

    (SELECT x.num, x.company, sy.name 
     FROM route x JOIN route y ON (x.num = y.num and x.company = y.company) 
                  JOIN stops sx ON sx.id = x.stop 
                  JOIN stops sy ON sy.id = y.stop 
     WHERE sx.name = 'Lochend' AND sy.name <> 'Lochend'
    )T

ON (S.name = T.name)
ORDER BY S.num, S.name, T.num
