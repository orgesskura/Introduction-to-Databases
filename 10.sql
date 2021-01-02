(select sub.uun,sub.name
from ( select s.uun,s.name,s.degree,count(distinct e.course) as count
from students s join programmes p on s.degree = p.degree join exams e on s.uun = e.student and e.course = p.course
group by s.uun,s.name,s.degree) as sub
where sub.count = ( select count(*) from programmes p2 
where p2.degree = sub.degree))
UNION 
(select s.uun , s.name
from students s
where not exists(select 1
from programmes p
where p.degree = s.degree));
