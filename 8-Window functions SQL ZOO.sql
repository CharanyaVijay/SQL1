Window Functions
1.SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

2.SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party

3.SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr

4.SELECT constituency,party, votes,
 RANK() over (partition BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency like 'E%'
   AND yr  = 2017
ORDER BY posn,constituency

5.select constituency,party 
from 
(
SELECT constituency,party, votes,
 RANK() over (partition BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn,constituency
)a where a.posn=1

6.select party,count(1) from (select constituency,party from (SELECT constituency,party, votes,RANK() over (partition by constituency order by votes desc) as r
  FROM ge
 WHERE constituency like 'S%'
   AND yr  = 2017
ORDER BY r , constituency
) x
where x.r=1) y
group by party
