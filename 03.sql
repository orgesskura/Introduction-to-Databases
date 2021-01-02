select s.uun,min(e.grade),max(e.grade),count(e.grade)
from students s join exams e on s.uun = e.student
group by s.uun
having avg(e.grade) >=75;
