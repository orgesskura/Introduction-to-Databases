select distinct s.uun
from students s
where not exists( select 1
from exams e 
where e.student = s.uun);
