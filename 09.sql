select e.student, max(e.date) as date
from exams e
where e.date = ( select sub.date
from ( select f.student,max(f.date) as date
from exams f
group by f.student) as sub
where sub.student = e.student)
group by e.student
having count(e.date) > 1 ;
