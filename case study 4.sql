create database RetailDB;
use RetailDB;
#table 1
Create Table products(      
id INT Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
price DECIMAL(10, 2) Not Null 
Check (price > 0),
stock INT Not Null
 Check (stock >= 0)
 );
 insert into products values
 (1,'rice',1670.05,20),
 (2,'sugar',50,45),
 (3,'wheat',70.8,77);
 select * from products;
#table 2
create table suppliers(     
id INt Primary Key Auto_Increment,
name VARCHAR(50) Not Null,
contact VARCHAR(50)
);
insert into suppliers values
(1,'abi',1546987256),
(2,'illak',5658749583),
(3,'saran',5697642198);
select * from suppliers;
#table 3
create table  sales(      
id INT Primary Key Auto_Increment,
prod_id INT, 
Foreign Key(prod_id) References Products(id),
date DATE Not Null,
quant INT Not Null Check (quant > 0),
total_price DECIMAL(10, 2) Not Null
);
drop table sales;
insert into sales values
(1,1,'2024-11-21',25,1670),
(2,3,'2024-11-20',2,120),
(3,2,'2024-11-20',3,230);
select* from sales;
# Queries: 
#List all products.
select Products.name from Products;
#Show products with stock less than 10
select products.name,products.stock from products where products.stock <10;
#List sales with product names and total prices
select products.name, sales.total_price from products join sales 
on sales.prod_id=products.id;
#Calculate the total sales for each product
select products.name, sum(sales.total_price) 
from sales join products on sales.prod_id=products.id
group by products.name;
