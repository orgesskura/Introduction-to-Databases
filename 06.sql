select sub.uun,sum(sub.A),sum(sub.B),sum(sub.C),sum(sub.D)
from(
(select s.uun,count(e.grade) as A, 0 as B, 0 as C , 0 as D
from students s join exams e on s.uun = e.student
where e.grade >=80
group by s.uun) 
UNION 
(select s.uun,0 as A, count(e.grade) as B , 0 as C, 0 as D
from students s join exams e on s.uun = e.student
where e.grade >= 60 and e.grade <= 79
group by s.uun)
UNION
( select s.uun, 0 as A , 0 as B, count(e.grade) as C , 0 as D
from students s join exams e on s.uun = e.student
where e.grade >=40 and e.grade<=59
group by s.uun)
UNION
(select s.uun,0 as A, 0 as B, 0 as C,count(e.grade) as D
from students s join exams e on s.uun = e.student
where e.grade < 40
group by s.uun) 
) as sub
group by sub.uun;
