More JOIN operations
1.SELECT id,title
  FROM movie
where yr=1962

2.SELECT yr
 FROM movie
 WHERE title='Citizen kane'

3.select id,title,yr
from movie
where title like '%Star Trek%'
order by yr

4.select id from actor where name='Glenn Close'

5.select id from movie
where title='Casablanca'

6.select name
from  
movie m join casting on movieid=m.id
join actor a on  a.id=actorid
where title='Casablanca'

7.select name
from  
movie m join casting on movieid=m.id
join actor a on  a.id=actorid
where title='Alien'

8.select title
from  
movie m join casting on movieid=m.id
join actor a on  a.id=actorid
where name='Harrison Ford'

9.select title
from  
movie m join casting on movieid=m.id
join actor a on  a.id=actorid
where name='Harrison Ford' and ord<>1

10.select title,name
from  
movie m join casting on movieid=m.id
join actor a on  a.id=actorid
where yr=1962 and ord=1

11.SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

12.SELECT title,name
from movie m join casting on (m.id=movieid and ord=1)
join actor a on (a.id=actorid)
where movieid  in (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')
)

13.select name 
from actor join casting on (id=actorid and ord=1)
group by name,ord
having count(ord)>=15
order by name asc

14.select title,count(actorid) actors
from movie m join casting 
on m.id=movieid
join actor a 
on a.id=actorid
where yr=1978
group by title
order by actors desc ,title 

15.select a.name from movie m
join casting on movieid=m.id
join actor a on a.id=actorid
where movieid in (select movieid from casting join actor 
on id=actorid and name='Art Garfunkel') 
and a.name<>'Art Garfunkel'
