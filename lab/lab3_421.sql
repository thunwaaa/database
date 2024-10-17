use university;

-- 1
select * from student s inner join takes using (id)
union
select s.*,
		null course_id,
        null sec_id,
        null semester,
        null year,
        null grade
from student s where s.id not in (select id from takes) order by id;

-- 2
select * from takes t inner join student s using (id)
union
select t.*,
		null name,
        null dept_name,
        null tot_cred
from takes t where t.id not in (select id from takes) order by id;

-- 3
select distinct i.ID, i.name, count(t.sec_id) as Section_No
from instructor i inner join teaches t on i.ID = t.ID
group by i.ID,i.name;

-- 4
select t.course_id, i.name, t.semester, t.year
from teaches t inner join instructor i 
on i.id = t.id
where t.semester like 'Spring' and year like '2010';

-- 5 
select d.dept_name, count(i.id) as tot_ins 
from department d inner join instructor i
on d.dept_name = i.dept_name group by d.dept_name;
