select A.institution,
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
