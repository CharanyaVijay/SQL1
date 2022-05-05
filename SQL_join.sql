game

id
team1
team2


goal
matchid
teamid
player
gtime

eteam
id
teamname
coach

SELECT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' AND teamid<>'GER')

SELECT title,name
from movie m join casting on (m.id=movieid and ord=1)
join actor a on (a.id=actorid)
where movieid  in (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')
)

select name 
from actor join casting on (id=actorid and ord=1)
group by name,ord
having count(ord)>=15
order by name asc

select title,count(actorid) actors
from movie m join casting 
on m.id=movieid
join actor a 
on a.id=actorid
where yr=1978
group by title
order by actors desc ,title 

select a.name from movie m
join casting on movieid=m.id
join actor a on a.id=actorid
where movieid in (select movieid from casting join actor 
on id=actorid and name='Art Garfunkel') 
and a.name<>'Art Garfunkel'

SELECT teacher.name, dept.name
 FROM teacher left  outer JOIN dept
           ON (teacher.dept=dept.id)

 SELECT teacher.name, dept.name
 FROM teacher right  outer JOIN dept
           ON (teacher.dept=dept.id)

select name,coalesce(mobile,'07986 444 2266')
from teacher

  COALESCE(x,y,z) = x if x is not NULL
  COALESCE(x,y,z) = y if x is NULL and y is not NULL
  COALESCE(x,y,z) = z if x and y are NULL but z is not NULL
  COALESCE(x,y,z) = NULL if x and y and z are all NULL

select teacher.name,coalesce(dept.name,'None')
from teacher left outer join dept on dept.id=teacher.dept

select count(id),count(mobile)
from teacher

select dept.name,count(teacher.id)
from dept inner join teacher on teacher.dept=dept.id
group by dept.name

select dept.name,count(teacher.id)
from dept left outer join teacher on teacher.dept=dept.id
group by dept.name
having count(teacher.id)>=0

select teacher.name,
        CASE WHEN dept.id=1 
            THEN 'Sci'
            WHEN dept.id=2 
            THEN 'Sci'
            ELSE 'Art'
 END
from teacher left outer join dept
 on (teacher.dept=dept.id)

select teacher.name,
        CASE WHEN dept.id=1 
            THEN 'Sci'
            WHEN dept.id=2 
            THEN 'Sci'
            WHEN dept.id=3 
            THEN 'Art'
            ELSE 'None'
 END
from teacher left outer join dept
 on (teacher.dept=dept.id)



