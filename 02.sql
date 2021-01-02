select count(distinct s.uun)
from students s join degrees d on s.degree = d.code
where d.type = 'PG';
