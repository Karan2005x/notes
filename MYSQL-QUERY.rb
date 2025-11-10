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

#Select with less then greater then
select * from demo_table
        where roll >5;

select * from demo_table
        where roll <=5;

select * from demo_table 
        where name > 'K';
Note:- Greater include the value itself like it  also display the word starting with 'K'

select * from demo_table 
        where name < 'K';

#Is Null and Is Not Null
select * from demo_table
        where name is null;

select * from demo_table
        where name is not null;

#AND operator
mysql> select * from demo_table where name ='Raj'
    -> and roll = 15;
+------+------+
| name | roll |
+------+------+
| Raj  |   15 |
+------+------+
1 row in set (0.00 sec)

mysql> select * from demo_table where name ='Raj' and roll = 14;
Empty set (0.00 sec)

mysql> select * from demo_table where name ='Raj' and roll = 16;
+------+------+
| name | roll |
+------+------+
| Raj  |   16 |
+------+------+
1 row in set (0.00 sec)

#OR operator
mysql> select * from demo_table where name ='Raj' or roll = 14;
+------+------+
| name | roll |
+------+------+
| Raj  |    4 |
| NULL |   14 |
| Raj  |   15 |
| Raj  |   16 |
+------+------+
4 rows in set (0.00 sec)

#Combination of AND & OR
mysql> select * from demo_table2
    -> where address = 'Jaipur'
    -> And (stu_id = 2 or name = 'Karan');
+--------+--------+---------+------------+----------+
| stu_id | name   | address | dob        | fees     |
+--------+--------+---------+------------+----------+
|      1 | Karan  | Jaipur  | NULL       | 50000.00 |
|      2 | Chandu | Jaipur  | 1998-07-15 | 60000.00 |
+--------+--------+---------+------------+----------+
2 rows in set (0.00 sec)



