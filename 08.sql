select distinct c.code
from programmes p join degrees d on p.degree = d.code
join courses C on p.course = c.code
where d.type = 'PG'
group by c.code
having count(distinct d.code) = 1;
