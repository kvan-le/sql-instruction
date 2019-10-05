select * from student ;

select * from course;


-- students with no middle initial
select * from student where middleInitial IS NULL;

-- ^ is tests against a boolean (true/false/null/neither) where = tests against equivalency
-- IS can only be used against variables that return true, false, or null

-- count function applied to student
select count(*) from student where state = 'NY';

-- showing state next to count function column
select state, count(*) from student group by state;

-- 1 student

-- youngest/oldest
select * from student order by birthday asc limit 1;

select firstname, lastname, birthday from student s
where s.birthday = (select max(birthday) from student);

select * from student s where s.birthday = (select min(birthday) from student);


-- figuring out age, current date and detaching year from bday and current date, then minus operator then name it Age
select birthday, 
year(birthday), curdate(), year(curdate()), 
(year(curdate()) - year(birthday)) as 'Age' 
from student
order by age;

-- age of oldest student
select firstname, lastname, birthday, 
year(birthday), curdate(), year(curdate()), 
(year(curdate()) - year(birthday)) as 'Age' 
from student

where birthday = (select min(birthday) from student)
order by age;
-- this filters it to oldest student from student




select * from course c
where c.subject = "socialStudies"
;

select * from course c where c.subject = "math";

-- list all subjects starting with the letter 'm'
select * from course where subject like 'm%';
-- ^ use LIKE in sql to see if the results has any that matches the variable, % is a wild card

select * from course where subject like 'm%c';
-- ^ use LIKE in sql to see if the results has any that matches the variable, % is a wild card with the ending is C




-- inner join show all students enrolled in courses
select * from student s
join enrolled e
on e.studentid = s.id
join course c 
on e.courseid = c.id;


-- outer join show all students enrolled in courses
-- report ALL students, and from there show only the students who are enrolled. 
-- the students who are not enrolled will have null values V

-- all students + enrollment
select s.id, firstname, lastname, e.studentid, e.courseid, e.grade from student s 
left join enrolled e
on e.studentid = s.id
;

-- all students + enrollment + course name
select s.id, firstname, lastname, e.studentid, e.courseid, c.name, e.grade from student s 
left join enrolled e
on e.studentid = s.id
left join course c
on e.courseid = c.id
;

-- find out the id number divisible by two 
-- != the exclamation mark means not equal to 2
select * from student
where id % 2 != 0;

-- all


