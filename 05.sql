(select p.degree, sum(c.credits) as credits
from programmes p join courses c on p.course = c.code
group by p.degree)
UNION
( select d.code , 0 as  credits
from degrees d 
where not exists( select 1
from programmes s
where s.degree = d.code));
