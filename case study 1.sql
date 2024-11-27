create database EmployeeManagement;
use EmployeeManagement;
# table 1
create table Departments_table(
id INT Primary Key Auto_Increment,
name VARCHAR(100) Not Null
);
select * from Departments_table;
#table 2
create table employee_table(
id int primary key auto_increment,
name VARCHAR(50) Not Null,
age INT Not Null,
gender VARCHAR(10) Not Null,
salary INT Not Null ,
dep_id INT ,
Foreign Key(dep_id) References Departments_table(id),
Check (Salary > 30000)
);
select * from employee_table;
#table 3
create table project_table(
id int primary key auto_increment,
name varchar(100) not null,
budget int not null
check (budget >1000)
);
select * from project_table;
#table 4
create table employee_project(
emp_id int,
foreign key(emp_id) references employee_table(id),
project_id int,
foreign key(project_id) references project_table(id),
primary key(emp_id, project_id)
);
select * from employee_project;
#table 5
create table Attendance_Table(
id int primary key auto_increment,
emp_id int,
foreign key (emp_id) references employee_table(id),
date date not null,
status enum('present', 'absent', 'on leave')
);
drop table Attendance_Table;
select * from Attendance_Table;

# value of table 1
insert into Departments_table(name) values 
('HR'),('engineering'),('marketing'),('financial'),('statistics');
#value of table 2
insert into employee_table(name,age,gender,salary,dep_id) values
('abi',24, 'female',35000,2),
('win',27,'male',70000,1),
('illak',22,'female',45000,4),
('bright',29,'male',69000,5),
('prem',27,'male',65000,3);
#value of table 3
insert into project_table(name,budget) values
('emp onboarding',10000),
('Website Redesign',25020),
('Dimetric',15000),
('Trimetric',10000),
('Parallel',5000);
#value of table 4
insert into employee_project() values
(1,1);
insert into employee_project() values
(2,3),
(3,4),
(4,5),
(5,2);
#values for table 5
insert into Attendance_Table (emp_id,date,status)values
(1,'2024-12-11','present'),
(2,'2024-02-21','absent'),
(3,'2024-05-04','on leave'),
(4,'2024-12-27','absent'),
(5,'2024-03-08','on leave');
select * from Attendance_Table;
#queries
#1Retrieve all employ ees.
select employee_table.name from employee_table;
#2 Retrieve all employees in the 'IT' department.
select Departments_table.name,
employee_table.id,employee_table.name
from Departments_table join employee_table on Departments_table.id = employee_table.id
where Departments_table.name='engineering';
#3  List all projects with a budget greater than 50000.
select * from project_table 
where project_table.budget > 50000;
#4 Show the names of employees and the projects they are working on.
select employee_table.name,project_table.name 
from employee_table join project_table on
 project_table.id =employee_table.id;
#5 Count the number of employees in each department.
select employee_table.name,Departments_table.name 
from on employee_table.id 
= Departments_table.id 
where count(employee_table.name);

#6 Find employees with a salary greater than 50000
select employee_table.name , employee_table.salary 
from employee_table
where  employee_table.salary > 50000;
#7 Get attendance records for a specific employee
select Attendance_Table.emp_id,date,status,employee_table.name
from employee_table join Attendance_Table on 
Attendance_Table.emp_id = employee_table.id
where employee_table.name='win';

#update records
#1 Increase the salary of employees in the 'HR' department by 10%
update employee_table
join Departments_table on employee_table.id = Departments_table.id
set salary =salary * 1.10
where Departments_table.name ='HR';
select employee_table.id,employee_table.name,employee_table.salary 
from employee_table;
#2 Change the department of an employee.
update employee_table
set dep_id=1
where dep_id=5;
select * from employee_table;

#Delete Records: 
#1 Remove an employee who has resigned
delete from Attendance_Table
where status = ' absent';
#2 Delete a project that is completed

#Constraints and Modifications:
#1 Add a unique constraint to the `email` column in `Employees` table.
alter table employee_table
add gamil varchar(100) unique;
#2 Ensure `age` is always greater than 18.
select * from employee_table
where age >18;
#3 Add a default value 'Unknown' to `gender` if not specified.
 alter table employee_table
modify column gender varchar(100) default('unknow');

