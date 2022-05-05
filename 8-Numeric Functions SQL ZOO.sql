Numeric Examples
1.SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'


2.SELECT institution,subject
  FROM nss
 WHERE question='Q15'
   AND score>=100

3.SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject='(8) Computer Science'

4.SELECT subject,sum(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   or subject='(8) Computer Science')
group by subject

5.SELECT subject,sum(response*A_STRONGLY_AGREE)/100
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   or subject='(8) Computer Science')
group by subject

6.SELECT subject,round(sum(response*A_STRONGLY_AGREE)/sum(response))
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   or subject='(8) Computer Science')
group by subject

7. SELECT institution,round(sum(response*score)/sum(response))
  FROM nss
 WHERE question='Q22'
   AND (institution like '%Manchester%')
group by institution

8. select A.institution,
A.sample,
B.comp
from
(SELECT institution,sum(sample) as sample
from nss
 WHERE
 institution like '%Manchester%'
 and   question='Q01'
group by institution) A
join
(SELECT institution,sum(sample) as comp
from nss
 WHERE
subject like '%comp%'
 and institution like '%Manchester%'
 and   question='Q01'
group by institution
) B
on A.institution=B.institution

