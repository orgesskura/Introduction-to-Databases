(select distinct c.code 
from programmes p join degrees d on p.degree = d.code
join courses c on p.course = c.code
where d.type = 'UG')
INTERSECT
(select distinct c.code
from programmes p join degrees d on p.degree = d.code
join courses c on p.course = c.code
where d.type = 'PG');
