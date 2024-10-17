use university;

select * from course;
select * from section;
select * from takes;
select * from teaches;
select * from prereq;
select * from instructor;
select * from student;

-- 1
select title from course where dept_name = 'Comp Sci.' and credits = 3;

-- 2
select distinct (ta.id) from teaches te join instructor ins using (id) join takes ta using (course_id) where ins.name = 'Einstein';

-- 3
select max(salary) from instructor;

-- 4 
select name from instructor where salary = (select max(salary) from instructor);

-- 5
select count(id) as enrollment, course_id from takes where semester = 'Fall' and year = 2009 group by course_id;

-- 6
select course_id, sec_id, enrollment from (select count(id) as enrollment, course_id, sec_id from takes where semester = 'Fall' and year = 2009
group by course_id, sec_id) as subq order by enrollment desc;

-- 7
select course_id, sec_id from (select count(id) as enrollment, sec_id, course_id from takes where semester = 'Fall' and year = 2009 group by course_id, sec_id) 
as max_sec order by enrollment desc limit 1;

-- 8
insert into course (course_id, title,credits) values ('CS-001', 'Weekly Seminar', '0');
-- error from check (credit > 0)
show create table course;

-- 9 
insert into section (course_id, sec_id, semester, year) values ('CS-001', 1, 'Fall', 2009);

-- 10
insert into takes (id, course_id, sec_id, semester, year) select student.id, 'CS-001', 1, 'Fall', 2009 
from student where dept_name = 'Comp Sci.';

-- 11
delete from takes where id in (select id from student where student.name = 'Chavez') and course_id = 'CS-001' 
and sec_id = '1' and semester = 'Fall' and year = 2009;

-- 12
delete from course where course_id = 'CS-001';
-- if we delete course_id = 'CS-001' from course, in section table data 'CS-001' will delete it too.

-- 13
delete from takes where (course_id, sec_id, semester, year) in (select course_id,sec_id,semester,year from course natural join section where lower(title) like '%database%');