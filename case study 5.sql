create database HospitalDB;
use HospitalDB;
#table 1
create table  Patients(     
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
age INT Not Null,
gender VARCHAR(10),
contact VARCHAR(50)
);
insert into Patients values
(1,'abi',20,'female',2469854623),
(2,'win',27,'male',4587695246),
(3,'illak',25,'female',3459875236);
select * from patients;
#table 2
create TABLE  Doctors (     
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
specialization VARCHAR(50) Not Null
);
insert into doctors values
(1,'Dr.malini','Surgery'),
(2,'Dr.karan','Cardiology'),
(3,'Dr.mani','Pathology');
select * from doctors;
#table 3
create table Appointments(     
id INT Primary Key Auto_Increment,
pat_id INT, 
Foreign Key(pat_id) References Patients(id),
doc_id INT ,
Foreign Key(doc_id) References Doctors(id),
app_date DATE Not Null,
status ENUM('Scheduled', 'Completed', 'Cancelled')
);
insert into Appointments values
(1,1,3,'2024-11-27','Scheduled'),
(2,3,2,'2024-11-20','Completed'),
(3,2,1,'2024-12-11','Cancelled');
select * from Appointments;
# Queries:
#List all patients.
select Patients.name from Patients;
#List all doctors.
select doctors.name from doctors;
#Show appointments with patient and doctor names.
select appointments.app_date,appointments.status,Patients.name,doctors.name 
from appointments inner join doctors on appointments.doc_id=doctors.id 
 inner join patients on appointments.pat_id=patients.id;
#Count appointments per doctor.
select count(doctors.name) from doctors join  Appointments on appointments.doc_id=doctors.id 
group by appointments.doc_id;


