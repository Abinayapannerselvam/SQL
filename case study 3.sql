Create Database StudentDB;
use StudentDB;
#table 1
create table student(
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
age INT Not Null,
email VARCHAR(50) Not Null Unique
);
insert into student values
(1,'abi',18,'abinaya@gmail.com'),
(2,'illak',20,'illa@gmail.com'),
(3,'saran',22,'saran@gmail.com');
select * from student;
#table2
create table courses(      
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null
);
insert into courses values
(1,'python'),
(2,'SQL'),
(3,'JAVA');
select * from courses;
#table3
create table enrollment(
student_id INT,
 Foreign Key(student_id) References Student(id),
 course_id INT,
 Foreign Key( course_id) References Courses(id),
grade CHAR(1),
Primary Key (student_id,course_id)
);
insert into enrollment values
(1,2,'a'),
(2,1,'b'),
(3,3,'c');
select * from enrollment;
 # Queries:      
#1 List all students.
select student.name from student;
#2 List all courses.
select courses.name from courses;
#3 Show the names of students and the courses they are enrolled in.

#4 Count the number of students in each course.
select count(student.id) from student join enrollment on enrollment.student_id=student.id
group by enrollment.student_id;

select student.name,courses.name 
from enrollment 
inner join courses on enrollment.course_id =courses.id
inner join enrollment.student_id=student.id;
