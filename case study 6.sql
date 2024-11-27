create database LearningDB;
use LearningDB;
#table 1
create table Courses(      
id INT Primary Key Auto_Increment,
title VARCHAR(100) Not Null,
description TEXT
);
insert into courses values
(1,'pyhton','handle models'),
(2,'sql','change tables'),
(3,'spss','analysis');
select* from courses;
#table 2
create table Instructors(      
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
expertise VARCHAR(50) Not Null
);
insert into instructors values
(1,'abi','library'),
(2,'illak','coding'),
(3,'saran','analysing');
select * from instructors;
#table 3
create table Students(     
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
email VARCHAR(50) Not Null Unique
);
insert into students values
(1,'xxx','xxx@gmail.com'),
(2,'yyy','yyy@gmail.com'),
(3,'zzz','zzz@gmail.com');
select * from students;
#table 4
create table  Enrollments (      
std_id INT,
 Foreign Key(std_id) References Students(id),
course_id INT,
 Foreign Key(course_id) References Courses(id),
enrollment_date DATE Not Null,
Primary Key (std_id, course_id)
);
insert into Enrollments values
(1,1,'2024-11-27'),
(2,2,'2024-11-29'),
(3,3,'2024-12-01');
select * from Enrollments;
# Queries
# List all courses.
select courses.title from courses;
# List all instructors.
select instructors.name from instructors;
# Show enrollments with student names and course titles
select students.name,courses.title 
from enrollments inner join  students on  enrollments.std_id =students.id
inner join courses on enrollments.course_id = courses.id;
# Count the number of students enrolled in each course
select count(students.name) from students join  enrollments on enrollments.std_id =students.id
group by enrollments.std_id;


