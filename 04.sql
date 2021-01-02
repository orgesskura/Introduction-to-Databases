select distinct sub.uun
from ( select s.uun , count(e.grade) as count
from students s join exams e on s.uun = e.student
where e.grade < 40
group by s.uun) as sub
where sub.count > ( select count 
from ( select s.uun,0.3 * count(e.grade) as count
from students s join exams e on s.uun = e.student
group by s.uun) as sub1
where sub1.uun = sub.uun);
