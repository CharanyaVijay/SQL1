Join operations

1.SELECT matchid,player FROM goal 
  WHERE teamid LIKE '%GER'

2.SELECT id,stadium,team1,team2
  FROM game
WHERE id=1012 

3.SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
where teamid like 'GER%'

4.SELECT team1,team2,player
  FROM game JOIN goal ON (id=matchid)
where player like 'Mario%'

5.SELECT player, teamid, coach,gtime
  FROM goal JOIN eteam on (id=teamid)
 WHERE gtime<=10

6.select mdate,teamname
from game JOIN eteam
on team1=eteam.id
where coach='Fernando Santos'

7.select player
from game join goal on id=matchid
where stadium='National Stadium, Warsaw'

8.SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' or team2='GER') AND (teamid<>'GER')

9.SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 group by teamname

10.select stadium,count(player)
from game join goal on id=matchid
group by stadium

11.SELECT matchid,mdate, count(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate

12.SELECT distinct matchid,mdate, count(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (teamid='GER')
group by matchid,mdate

13.SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
 sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game left outer JOIN goal ON matchid = id
group by
mdate,team1,team2
order by mdate,matchid,team1,team2 asc
