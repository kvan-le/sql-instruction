select * from course;
select * from student;
select * from enrolled;

-- student - enrolled join
select firstName, lastName, courseID, grade
  from student s
  join enrolled e
    on s.id = e.studentID;
    
-- course - enrolled join
select subject, name, courseID, grade 
  from course
  join enrolled
    on course.id = enrolled.courseID;
    
-- 3 table join!!
select s.firstName, s.lastName, e.grade, c.subject, c.name 
  from student s
  join enrolled e
    on s.id = e.studentID
  join course c
    on c.id = e.courseID
