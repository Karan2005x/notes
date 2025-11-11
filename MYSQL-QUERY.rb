#SQL Start
mysql -u karan -p
Bamniya@2005

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

#IN operator
mysql> select * from demo_table2
    -> where address in ('Jaipur','Tonk');

#NOT IN operator
select * from demo_table2
 where address not in ('Jaipur','Tonk');

#BETWEEN operator
mysql> select * from demo_table
    -> where roll between 7 and 14; (Including 7 and 14)
+--------+------+
| name   | roll |
+--------+------+
| Viraj  |    7 |
| Aditya |    8 |
| Lizza  |    9 |
| Deepak |   10 |
| Chandu |   11 |
| NULL   |   12 |
| NULL   |   13 |
| NULL   |   14 |
+--------+------+
8 rows in set (0.00 sec)

mysql> select * from demo_table
    -> where name between 'A' and 'n';(Uncluding A but no N)
+---------------+------+
| name          | roll |
+---------------+------+
| D.K's Company |    1 |
| K.K's Company |    2 |
| Karan         |    3 |
| Gaurav        |    5 |
| Aditya        |    8 |
| Lizza         |    9 |
| Deepak        |   10 |
| Chandu        |   11 |
+---------------+------+
8 rows in set (0.00 sec)

mysql> select * from demo_table2
    -> where dob between '1996-05-28' and '2000-01-01';(Including Both Dates)
+--------+--------+-----------+------------+----------+
| stu_id | name   | address   | dob        | fees     |
+--------+--------+-----------+------------+----------+
|      2 | Chandu | Jaipur    | 1998-07-15 | 60000.00 |
|      3 | Pooja  | Delhi     | 1999-03-22 | 55000.00 |
|      6 | Arjun  | Kolkata   | 1997-09-05 | 62000.00 |
|      8 | Rahul  | Bhopal    | 1998-12-09 | 51000.00 |
|     10 | Vikram | Hyderabad | 1996-05-28 | 65000.00 |
+--------+--------+-----------+------------+----------+
5 rows in set (0.00 sec)

#NOT BETWEEN
mysql> select * from demo_table
    -> where roll not between 4 and 9;(NOT Including 4 and 9)
+---------------+------+
| name          | roll |
+---------------+------+
| D.K's Company |    1 |
| K.K's Company |    2 |
| Karan         |    3 |
| Deepak        |   10 |
| Chandu        |   11 |
| NULL          |   12 |
| NULL          |   13 |
| NULL          |   14 |
| Raj           |   15 |
| Raj           |   16 |
+---------------+------+
10 rows in set (0.00 sec)

mysql> select * from demo_table2;
+--------+--------+-----------+------------+----------+
| stu_id | name   | address   | dob        | fees     |
+--------+--------+-----------+------------+----------+
|      1 | Karan  | Jaipur    | NULL       | 50000.00 |
|      2 | Chandu | Jaipur    | 1998-07-15 | 60000.00 |
|      3 | Rohit  | Jodhpur   | NULL       | 30000.00 |
|      4 | Raju   | Tonk      | NULL       | 25000.00 |
|      5 | Jatin  | Bundi     | NULL       | 40000.00 |
|      3 | Pooja  | Delhi     | 1999-03-22 | 55000.00 |
|      4 | Ravi   | Mumbai    | 2000-11-10 | 48000.00 |
|      5 | Neha   | Pune      | NULL       | 53000.00 |
|      6 | Arjun  | Kolkata   | 1997-09-05 | 62000.00 |
|      7 | Simran | Chennai   | 2001-01-19 | 47000.00 |
|      8 | Rahul  | Bhopal    | 1998-12-09 | 51000.00 |
|      9 | Divya  | Ahmedabad | NULL       | 59000.00 |
|     10 | Vikram | Hyderabad | 1996-05-28 | 65000.00 |
+--------+--------+-----------+------------+----------+
13 rows in set (0.00 sec)

mysql> select * from demo_table2
    -> where name not between 'B'and 'K';(Including B but no K)
+--------+--------+-----------+------------+----------+
| stu_id | name   | address   | dob        | fees     |
+--------+--------+-----------+------------+----------+
|      1 | Karan  | Jaipur    | NULL       | 50000.00 |
|      3 | Rohit  | Jodhpur   | NULL       | 30000.00 |
|      4 | Raju   | Tonk      | NULL       | 25000.00 |
|      3 | Pooja  | Delhi     | 1999-03-22 | 55000.00 |
|      4 | Ravi   | Mumbai    | 2000-11-10 | 48000.00 |
|      5 | Neha   | Pune      | NULL       | 53000.00 |
|      6 | Arjun  | Kolkata   | 1997-09-05 | 62000.00 |
|      7 | Simran | Chennai   | 2001-01-19 | 47000.00 |
|      8 | Rahul  | Bhopal    | 1998-12-09 | 51000.00 |
|     10 | Vikram | Hyderabad | 1996-05-28 | 65000.00 |
+--------+--------+-----------+------------+----------+
10 rows in set (0.00 sec)

mysql> select * from demo_table2;
+--------+--------+-----------+------------+----------+
| stu_id | name   | address   | dob        | fees     |
+--------+--------+-----------+------------+----------+
|      1 | Karan  | Jaipur    | NULL       | 50000.00 |
|      2 | Chandu | Jaipur    | 1998-07-15 | 60000.00 |
|      3 | Rohit  | Jodhpur   | NULL       | 30000.00 |
|      4 | Raju   | Tonk      | NULL       | 25000.00 |
|      5 | Jatin  | Bundi     | NULL       | 40000.00 |
|      3 | Pooja  | Delhi     | 1999-03-22 | 55000.00 |
|      4 | Ravi   | Mumbai    | 2000-11-10 | 48000.00 |
|      5 | Neha   | Pune      | NULL       | 53000.00 |
|      6 | Arjun  | Kolkata   | 1997-09-05 | 62000.00 |
|      7 | Simran | Chennai   | 2001-01-19 | 47000.00 |
|      8 | Rahul  | Bhopal    | 1998-12-09 | 51000.00 |
|      9 | Divya  | Ahmedabad | NULL       | 59000.00 |
|     10 | Vikram | Hyderabad | 1996-05-28 | 65000.00 |
+--------+--------+-----------+------------+----------+
13 rows in set (0.00 sec)

mysql> select * from demo_table2 
    -> where dob not between '1996-01-05' and '2000-01-01';(including both dates)
+--------+--------+---------+------------+----------+
| stu_id | name   | address | dob        | fees     |
+--------+--------+---------+------------+----------+
|      4 | Ravi   | Mumbai  | 2000-11-10 | 48000.00 |
|      7 | Simran | Chennai | 2001-01-19 | 47000.00 |
+--------+--------+---------+------------+----------+
2 rows in set (0.00 sec)

#BETWEEN with IN 
mysql> select * from demo_table3 where (salary between '15000' and '35000') and dept in ('it' and 'hr');
+--------+----------+------------+------------+--------+----------+--------+------------------------+
| emp_id | emp_name | dob        | dept       | salary | city     | pin    | email                  |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
|    101 | Ram      | 1990-01-01 | IT         |  30000 | Delhi    | 800001 | ram@geekyshows.com     |
|    103 | Tanu     | 1990-01-01 | Accountant |  15000 | Delhi    | 800001 | tanu@geekyshows.com    |
|    104 | Sunil    | 1989-12-05 | IT         |  30000 | Kolkata  | 800003 | susil@geekyshows.com   |
|    106 | Komal    | 1992-11-03 | HR         |  35000 | Ranchi   | 800004 | komal@geekyshows.com   |
|    107 | Vinay    | 1990-10-06 | HR         |  35000 | Kolkata  | 800003 | vinay@geekyshows.com   |
|    108 | Dev      | 1989-09-25 | IT         |  30000 | Mumbai   | 800002 | dev@geekyshows.com     |
|    109 | Suhana   | 1990-07-15 | IT         |  30000 | Ranchi   | 800004 | suhana@geekyshows.com  |
|    110 | Puja     | 1988-01-26 | HR         |  35000 | Banglore | 800005 | puja@geekyshows.com    |
|    111 | Raja     | 1992-11-03 | Accountant |  20000 | Patna    | 800006 | raja@geekyshows.com    |
|    112 | Jai      | 1990-01-18 | Trainer    |  20000 | Chennai  | 800007 | jai@geekyshows.com     |
|    113 | Sonam    | 1990-01-18 | Trainer    |  20000 | J&K      | 800008 | sonamtr@geekyshows.com |
|    114 | Dev      | 1989-09-25 | IT         |  30000 | Chennai  | 800009 | devit@geekyshows.com   |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
12 rows in set, 5 warnings (0.00 sec)

#BETWEEN with NOT IN
mysql> select * from demo_table3 where (salary between 20000 and 35000) and not dept in ('it','hr');
+--------+----------+------------+------------+--------+---------+--------+------------------------+
| emp_id | emp_name | dob        | dept       | salary | city    | pin    | email                  |
+--------+----------+------------+------------+--------+---------+--------+------------------------+
|    111 | Raja     | 1992-11-03 | Accountant |  20000 | Patna   | 800006 | raja@geekyshows.com    |
|    112 | Jai      | 1990-01-18 | Trainer    |  20000 | Chennai | 800007 | jai@geekyshows.com     |
|    113 | Sonam    | 1990-01-18 | Trainer    |  20000 | J&K     | 800008 | sonamtr@geekyshows.com |
+--------+----------+------------+------------+--------+---------+--------+------------------------+
3 rows in set (0.00 sec)

#Like with % WildCard (for many characters)(Zero or more character)
mysql> select *  from demo_table3
    -> where emp_name like 'su%';
+--------+----------+------------+------+--------+---------+--------+-----------------------+
| emp_id | emp_name | dob        | dept | salary | city    | pin    | email                 |
+--------+----------+------------+------+--------+---------+--------+-----------------------+
|    104 | Sunil    | 1989-12-05 | IT   |  30000 | Kolkata | 800003 | susil@geekyshows.com  |
|    109 | Suhana   | 1990-07-15 | IT   |  30000 | Ranchi  | 800004 | suhana@geekyshows.com |
+--------+----------+------------+------+--------+---------+--------+-----------------------+
2 rows in set (0.00 sec)

mysql> select *  from demo_table3 where city like '%l%';
+--------+----------+------------+------------+--------+----------+--------+----------------------+
| emp_id | emp_name | dob        | dept       | salary | city     | pin    | email                |
+--------+----------+------------+------------+--------+----------+--------+----------------------+
|    101 | Ram      | 1990-01-01 | IT         |  30000 | Delhi    | 800001 | ram@geekyshows.com   |
|    103 | Tanu     | 1990-01-01 | Accountant |  15000 | Delhi    | 800001 | tanu@geekyshows.com  |
|    104 | Sunil    | 1989-12-05 | IT         |  30000 | Kolkata  | 800003 | susil@geekyshows.com |
|    105 | Sonam    | 1992-12-05 | Executive  |  10000 | Kolkata  | 800003 | sonam@geekyshows.com |
|    107 | Vinay    | 1990-10-06 | HR         |  35000 | Kolkata  | 800003 | vinay@geekyshows.com |
|    110 | Puja     | 1988-01-26 | HR         |  35000 | Banglore | 800005 | puja@geekyshows.com  |
+--------+----------+------------+------------+--------+----------+--------+----------------------+
6 rows in set (0.00 sec)

#Like with _ wildcard (One single character)
mysql> select *  from demo_table3 where emp_name like '_am';
+--------+----------+------------+------+--------+-------+--------+--------------------+
| emp_id | emp_name | dob        | dept | salary | city  | pin    | email              |
+--------+----------+------------+------+--------+-------+--------+--------------------+
|    101 | Ram      | 1990-01-01 | IT   |  30000 | Delhi | 800001 | ram@geekyshows.com |
+--------+----------+------------+------+--------+-------+--------+--------------------+
1 row in set (0.00 sec)

#NOT LIKE
mysql> select *  from demo_table3 where emp_name not like '%nu';
+--------+----------+------------+------------+--------+----------+--------+------------------------+
| emp_id | emp_name | dob        | dept       | salary | city     | pin    | email                  |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
|    101 | Ram      | 1990-01-01 | IT         |  30000 | Delhi    | 800001 | ram@geekyshows.com     |
|    102 | Amit     | 1988-04-03 | Research   |  45000 | Mumbai   | 800002 | amit@geekyshows.com    |
|    104 | Sunil    | 1989-12-05 | IT         |  30000 | Kolkata  | 800003 | susil@geekyshows.com   |
|    105 | Sonam    | 1992-12-05 | Executive  |  10000 | Kolkata  | 800003 | sonam@geekyshows.com   |
|    106 | Komal    | 1992-11-03 | HR         |  35000 | Ranchi   | 800004 | komal@geekyshows.com   |
|    107 | Vinay    | 1990-10-06 | HR         |  35000 | Kolkata  | 800003 | vinay@geekyshows.com   |
|    108 | Dev      | 1989-09-25 | IT         |  30000 | Mumbai   | 800002 | dev@geekyshows.com     |
|    109 | Suhana   | 1990-07-15 | IT         |  30000 | Ranchi   | 800004 | suhana@geekyshows.com  |
|    110 | Puja     | 1988-01-26 | HR         |  35000 | Banglore | 800005 | puja@geekyshows.com    |
|    111 | Raja     | 1992-11-03 | Accountant |  20000 | Patna    | 800006 | raja@geekyshows.com    |
|    112 | Jai      | 1990-01-18 | Trainer    |  20000 | Chennai  | 800007 | jai@geekyshows.com     |
|    113 | Sonam    | 1990-01-18 | Trainer    |  20000 | J&K      | 800008 | sonamtr@geekyshows.com |
|    114 | Dev      | 1989-09-25 | IT         |  30000 | Chennai  | 800009 | devit@geekyshows.com   |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
13 rows in set (0.00 sec)

#ORDER BY decending order
mysql> select * from demo_table3
    -> order by emp_name desc;
+--------+----------+------------+------------+--------+----------+--------+------------------------+
| emp_id | emp_name | dob        | dept       | salary | city     | pin    | email                  |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
|    107 | Vinay    | 1990-10-06 | HR         |  35000 | Kolkata  | 800003 | vinay@geekyshows.com   |
|    103 | Tanu     | 1990-01-01 | Accountant |  15000 | Delhi    | 800001 | tanu@geekyshows.com    |
|    104 | Sunil    | 1989-12-05 | IT         |  30000 | Kolkata  | 800003 | susil@geekyshows.com   |
|    109 | Suhana   | 1990-07-15 | IT         |  30000 | Ranchi   | 800004 | suhana@geekyshows.com  |
|    105 | Sonam    | 1992-12-05 | Executive  |  10000 | Kolkata  | 800003 | sonam@geekyshows.com   |
|    113 | Sonam    | 1990-01-18 | Trainer    |  20000 | J&K      | 800008 | sonamtr@geekyshows.com |
|    101 | Ram      | 1990-01-01 | IT         |  30000 | Delhi    | 800001 | ram@geekyshows.com     |
|    111 | Raja     | 1992-11-03 | Accountant |  20000 | Patna    | 800006 | raja@geekyshows.com    |
|    110 | Puja     | 1988-01-26 | HR         |  35000 | Banglore | 800005 | puja@geekyshows.com    |
|    106 | Komal    | 1992-11-03 | HR         |  35000 | Ranchi   | 800004 | komal@geekyshows.com   |
|    112 | Jai      | 1990-01-18 | Trainer    |  20000 | Chennai  | 800007 | jai@geekyshows.com     |
|    108 | Dev      | 1989-09-25 | IT         |  30000 | Mumbai   | 800002 | dev@geekyshows.com     |
|    114 | Dev      | 1989-09-25 | IT         |  30000 | Chennai  | 800009 | devit@geekyshows.com   |
|    102 | Amit     | 1988-04-03 | Research   |  45000 | Mumbai   | 800002 | amit@geekyshows.com    |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
14 rows in set (0.00 sec)

#ORDER BY Asecending order (By default table is in asecending order)
mysql> select * from demo_table3 order by emp_id asc;
+--------+----------+------------+------------+--------+----------+--------+------------------------+
| emp_id | emp_name | dob        | dept       | salary | city     | pin    | email                  |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
|    101 | Ram      | 1990-01-01 | IT         |  30000 | Delhi    | 800001 | ram@geekyshows.com     |
|    102 | Amit     | 1988-04-03 | Research   |  45000 | Mumbai   | 800002 | amit@geekyshows.com    |
|    103 | Tanu     | 1990-01-01 | Accountant |  15000 | Delhi    | 800001 | tanu@geekyshows.com    |
|    104 | Sunil    | 1989-12-05 | IT         |  30000 | Kolkata  | 800003 | susil@geekyshows.com   |
|    105 | Sonam    | 1992-12-05 | Executive  |  10000 | Kolkata  | 800003 | sonam@geekyshows.com   |
|    106 | Komal    | 1992-11-03 | HR         |  35000 | Ranchi   | 800004 | komal@geekyshows.com   |
|    107 | Vinay    | 1990-10-06 | HR         |  35000 | Kolkata  | 800003 | vinay@geekyshows.com   |
|    108 | Dev      | 1989-09-25 | IT         |  30000 | Mumbai   | 800002 | dev@geekyshows.com     |
|    109 | Suhana   | 1990-07-15 | IT         |  30000 | Ranchi   | 800004 | suhana@geekyshows.com  |
|    110 | Puja     | 1988-01-26 | HR         |  35000 | Banglore | 800005 | puja@geekyshows.com    |
|    111 | Raja     | 1992-11-03 | Accountant |  20000 | Patna    | 800006 | raja@geekyshows.com    |
|    112 | Jai      | 1990-01-18 | Trainer    |  20000 | Chennai  | 800007 | jai@geekyshows.com     |
|    113 | Sonam    | 1990-01-18 | Trainer    |  20000 | J&K      | 800008 | sonamtr@geekyshows.com |
|    114 | Dev      | 1989-09-25 | IT         |  30000 | Chennai  | 800009 | devit@geekyshows.com   |
+--------+----------+------------+------------+--------+----------+--------+------------------------+
14 rows in set (0.00 sec)

#NOT NULL
mysql> create table my_db(
    -> id int (5) not null,
    -> name varchar(50),
    -> city varchar(100)
    -> );

mysql> desc my_db;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   |     | NULL    |       |
| name  | varchar(50)  | YES  |     | NULL    |       |
| city  | varchar(100) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

#UNIQUE KEY
mysql> create table uniquedemo
    -> (
    -> stu_id int (5) unique key,
    -> name varchar (30),
    -> roll int (5) unique key,
    -> city varchar (40)
    -> );
Query OK, 0 rows affected, 2 warnings (0.05 sec)

Note:- Unique key can also contain NULL VALUES

mysql> insert into uniquedemo values (1,'Ram',101,'Delhi');
Query OK, 1 row affected (0.01 sec)

mysql> insert into uniquedemo (name,roll,city)
    -> values('Shyam',102,'Delhi');
Query OK, 1 row affected (0.01 sec)

#Primary Key
Note:- Primary Key can not contain any null value.
mysql> create table primarydemo 
    -> (
    -> id int (5) not null primary key,
    -> name varchar (50),
    -> roll int (5) unique key,
    -> city varchar (50)
    -> );
Query OK, 0 rows affected, 2 warnings (0.05 sec)

mysql> desc primarydemo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
| roll  | int         | YES  | UNI | NULL    |       |
| city  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into primarydemo (id,name,roll,city)
    -> values (1,'Raj',101,'Delhi');
Query OK, 1 row affected (0.01 sec)

#AUTO INCREMENT 
Note:- do not specify the size is the best practice for this.

        mysql> create table incrementdemo
    -> (
    -> id int not null auto_increment,
    -> name varchar (50),
    -> city varchar (60),
    -> primary key (id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> desc incrementdemo;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | YES  |     | NULL    |                |
| city  | varchar(60) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

Note :- Auto Increment from a specific number
mysql> alter table incrementdemo auto_increment = 10;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into incrementdemo (name,city) values ('Karan','Jaipur');
Query OK, 1 row affected (0.01 sec)

mysql> select * from incrementdemo;
+----+-------+----------+
| id | name  | city     |
+----+-------+----------+
|  1 | Raj   | Delhi    |
|  2 | Rani  | Kolkatta |
| 10 | Karan | Jaipur   |
+----+-------+----------+
3 rows in set (0.00 sec)

#ALIAS 
Note:- Temporarily changing the name of column or table
mysql> select name as "Student Name" from demo_table; (AS is optional)
+---------------+
| Student Name  |
+---------------+
| D.K's Company |
| K.K's Company |
| Karan         |
| Raj           |
| Gaurav        |
| Vikas         |
| Viraj         |
| Aditya        |
| Lizza         |
| Deepak        |
| Chandu        |
| NULL          |
| NULL          |
| NULL          |
| Raj           |
| Raj           |
+---------------+
16 rows in set (0.00 sec)

#Arithmetic Operators (/*-+)

mysql> select stid, name, mark,mark+100 as "New Marks"from student;
+------+-------+------+-----------+
| stid | name  | mark | New Marks |
+------+-------+------+-----------+
|    1 | Rahul |  300 |       400 |
|    2 | Rani  |  250 |       350 |
|    3 | Soni  |  320 |       420 |
|    4 | Jai   |  255 |       355 |
|    5 | Rock  |  150 |       250 |
|    6 | Sonam |  145 |       245 |
+------+-------+------+-----------+
6 rows in set (0.00 sec)

#DISTINCT
Note:- Does not display duplicate values

mysql> select distinct emp_name as employees from demo_table3;
+-----------+
| employees |
+-----------+
| Ram       |
| Amit      |
| Tanu      |
| Sunil     |
| Sonam     |
| Komal     |
| Vinay     |
| Dev       |
| Suhana    |
| Puja      |
| Raja      |
| Jai       |
+-----------+
12 rows in set (0.01 sec)

#ALTER
mysql> Alter table demo_table3
    -> add column m_no int (11);
Query OK, 0 rows affected, 1 warning (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 1

#ADD Column by position (By default column will be added at last)
mysql> alter table demo_table
    -> add column stu_id int (5) FIRST;
Query OK, 0 rows affected, 1 warning (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> select * from demo_table;
+--------+---------------+------+
| stu_id | name          | roll |
+--------+---------------+------+
|   NULL | D.K's Company |    1 |
|   NULL | K.K's Company |    2 |
|   NULL | Karan         |    3 |
|   NULL | Raj           |    4 |
|   NULL | Gaurav        |    5 |
|   NULL | Vikas         |    6 |
|   NULL | Viraj         |    7 |
|   NULL | Aditya        |    8 |
|   NULL | Lizza         |    9 |
|   NULL | Deepak        |   10 |
|   NULL | Chandu        |   11 |
|   NULL | NULL          |   12 |
|   NULL | NULL          |   13 |
|   NULL | NULL          |   14 |
|   NULL | Raj           |   15 |
|   NULL | Raj           |   16 |
+--------+---------------+------+
16 rows in set (0.00 sec)

mysql> alter table demo_table
    -> add column last_name varchar (50) AFTER name;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from demo_table;
+--------+---------------+-----------+------+
| stu_id | name          | last_name | roll |
+--------+---------------+-----------+------+
|   NULL | D.K's Company | NULL      |    1 |
|   NULL | K.K's Company | NULL      |    2 |
|   NULL | Karan         | NULL      |    3 |
|   NULL | Raj           | NULL      |    4 |
|   NULL | Gaurav        | NULL      |    5 |
|   NULL | Vikas         | NULL      |    6 |
|   NULL | Viraj         | NULL      |    7 |
|   NULL | Aditya        | NULL      |    8 |
|   NULL | Lizza         | NULL      |    9 |
|   NULL | Deepak        | NULL      |   10 |
|   NULL | Chandu        | NULL      |   11 |
|   NULL | NULL          | NULL      |   12 |
|   NULL | NULL          | NULL      |   13 |
|   NULL | NULL          | NULL      |   14 |
|   NULL | Raj           | NULL      |   15 |
|   NULL | Raj           | NULL      |   16 |
+--------+---------------+-----------+------+
16 rows in set (0.01 sec)

mysql> alter table items
    -> add column item_n int (5) not null auto_increment,
    -> add primary key (item_n);
Query OK, 0 rows affected, 1 warning (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> select * from items;
+--------+---------+--------+
| name   | item_no | item_n |
+--------+---------+--------+
| Mobile |       0 |      1 |
| Laptop |       0 |      2 |
| TV     |       0 |      3 |
| PC     |       0 |      4 |
| Cam    |       0 |      5 |
+--------+---------+--------+
5 rows in set (0.00 sec)

