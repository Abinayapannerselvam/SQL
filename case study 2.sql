Create Database LibraryDB;
use LibraryDB;
#table 1
Create Table Books(
id INT Primary Key Auto_Increment,
title VARCHAR(100) Not Null,
author VARCHAR(50) Not Null,
published_year YEAR Not Null,
genre VARCHAR(30)
);
insert into Books values
(1,'why not me','abhul',2016,'romance'),
(2,'ends with us','colban',2015,'romance'),
(3,'a good girl guide murder','holly jackson',2017,'serialkiller');
select * from C;
 #table 2
 create table Members(
 id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
membership_date DATE Not Null
);
insert into Members(name,membership_date) values
('abi','2016-05-03'),
('illak','2016-01-20'),
('saran','2017-10-08');
select * from Members;

#table 3
create table Borrowing(
id INT Primary Key Auto_Increment,
book_id INT ,
Foreign Key(book_id) References Books(id),
member_id INt ,
Foreign Key(member_id) References Members(id),
borrow_date DATE Not Null,
borrow_date DATE
);
insert into Borrowing values
(1,2,1,'2016-10-18','2016-11-22'),
(2,3,2,'2016-05-01','2016-05-30'),
(3,1,3,'2017-12-11','2018-01-01');
select * from Borrowing;
# Queries: 
#1 List all books.
select Books.title from Books;
#2 List all members.
select Members.name from Members;
#3 Show borrowing records with member names and book titles.
select Members.name, Books.title ,
Borrowing.id,Borrowing.book_id,Borrowing.member_id,Borrowing.borrow_date,Borrowing.return_date
from Borrowing inner join Members on Borrowing.member_id=Members.id 
inner join Books on Borrowing.book_id=books.id;
#4 Count the number of books borrowed by each member.
select count(books.id) from books join borrowing on borrowing.book_id=books.id
group by borrowing.member_id;
