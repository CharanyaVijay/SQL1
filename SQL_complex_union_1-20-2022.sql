select institution,
sample,
comp
from
(SELECT institution,sum(sample) as sample,0 as comp
from nss
 WHERE
 institution like '%Manchester%'
 and   question='Q01'
group by institution
UNION
SELECT institution,0,sum(sample) as comp
from nss
 WHERE
subject like '%comp%'
 and institution like '%Manchester%'
 and   question='Q01'
group by institution
)a
where comp is not null


SELECT institution,
sum(sample)  sample,
0  comp
from nss
 WHERE
 institution like '%Manchester%'
 and   question='Q01'
group by institution
UNION
SELECT institution,
0,
sum(sample)
from nss
 WHERE
subject like '%comp%'
 and institution like '%Manchester%'
 and   question='Q01'
group by institution

