Using NUll

1. SELECT name  
  FROM teacher
where dept is null

2.SELECT teacher.name, dept.name
 FROM teacher  inner JOIN dept
           ON (teacher.dept=dept.id)

3.SELECT teacher.name, dept.name
 FROM teacher left  outer JOIN dept
           ON (teacher.dept=dept.id)

4.SELECT teacher.name, dept.name
 FROM teacher right  outer JOIN dept
           ON (teacher.dept=dept.id)

5.select name,coalesce(mobile,'07986 444 2266')
from teacher

6.select teacher.name,coalesce(dept.name,'None')
from teacher left outer join dept on dept.id=teacher.dept

7.select count(id),count(mobile)
from teacher

8.select dept.name,count(teacher.id)
from dept left outer join teacher on teacher.dept=dept.id
group by dept.name
having count(teacher.id)>=0

9.select teacher.name,
        CASE WHEN dept.id=1 
            THEN 'Sci'
            WHEN dept.id=2 
            THEN 'Sci'
            ELSE 'Art'
 END
from teacher left outer join dept
 on (teacher.dept=dept.id)

10.select teacher.name,
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
