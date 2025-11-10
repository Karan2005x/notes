#SQL Start
mysql -u root -p

#Create Database
create database demo_db;

#Use Database
use demo_db;

#Create table
create table demo_table
(
name varchar (50),
roll int (4) not null primary key
);

#show tables
show tables;

#Info of table or describe the table
desc demo_table;

#Insert into table using column name 
insert into demo_table2(stu_id,name,address,fees) values(1,'Karan','Jaipur',50000.00);

#Insert into table without specifying column name
insert into demo_table2 values(2,'Chandu','Jaipur', STR_TO_DATE('15-07-1998', '%d-%m-%Y'),60000.00);

#Insert into changing column order
insert into demo_table2(stu_id,fees,name,address)
            values(3,30000,'Rohit','Jodhpur');

#Insert multi records at a time
insert into demo_table2(stu_id,fees,name,address) 
            values(4,25000,'Raju','Tonk'),
            (5,40000,'Jatin','Bundi');

#Showing all data of the table
select * from demo_table2;

#specific column from a table
select stu_id from demo_table2;

#Resolving single quotes problem
*Use two time single quotes
'K.K''s Company'
insert into demo_table(name,roll) values('D.K''s Company',1);

*Use backslash
'K.K\'s Company'
insert into demo_table(name,roll) values('K.K\'s Company',2);

#Select with Limit
select * from demo_table
limit 5;

Note:- It count from the 0'th index' 
select * from demo_table limit 0,7;

Note:- It count from the 1'th index' 
select * from demo_table limit 1,7;

#Select with conditions
select * from demo_table  where name='Gaurav';

#We don't want to select viraj so...
select * from demo_table  
        where name !='Viraj';
