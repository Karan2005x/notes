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

#ALTER table adding constraint
mysql> alter table items  
    -> add constraint unique key (seller_id);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

#Changing column name and its data type
mysql> alter table items
    -> change column name p_name varchar (50);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

#Changing many columns at a time
mysql> alter table items
    -> change column seller_id sale_id int (8),
    -> change column p_name product_name varchar (50);
Query OK, 0 rows affected, 1 warning (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 1

#Changing column name and its data type with constraints
mysql> alter table test 
    -> change column id stu_id int (10) not null,
    -> add primary key (stu_id);
Query OK, 0 rows affected, 1 warning (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 1

#Changing column data type
mysql> alter table test 
    -> modify column name char (40);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc test;
+--------+----------+------+-----+---------+-------+
| Field  | Type     | Null | Key | Default | Extra |
+--------+----------+------+-----+---------+-------+
| stu_id | int      | NO   | PRI | NULL    |       |
| name   | char(40) | YES  |     | NULL    |       |
+--------+----------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table test  modify column name char (40) not null;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc test;
+--------+----------+------+-----+---------+-------+
| Field  | Type     | Null | Key | Default | Extra |
+--------+----------+------+-----+---------+-------+
| stu_id | int      | NO   | PRI | NULL    |       |
| name   | char(40) | NO   |     | NULL    |       |
+--------+----------+------+-----+---------+-------+
2 rows in set (0.00 sec)

#For deleting the unique key we have to delete its index
mysql> desc test;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| id    | int  | YES  | UNI | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> alter table test  drop index id_2;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc test;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| id    | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.00 sec)

#Drop table or delete table
mysql> create table my_table ( name varchar (30), id int (11) not null primary key );
Query OK, 0 rows affected, 1 warning (0.05 sec)

mysql> desc my_table;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(30) | YES  |     | NULL    |       |
| id    | int         | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> drop table my_table;
Query OK, 0 rows affected (0.02 sec)

#TRUNCATE TABLE used to delete the data not the table
mysql> select * from people;
+----+---------+--------------+
| id | name    | city         |
+----+---------+--------------+
|  1 | Alice   | New York     |
|  2 | Bob     | Los Angeles  |
|  3 | Charlie | Chicago      |
|  4 | David   | Houston      |
|  5 | Eva     | Phoenix      |
|  6 | Frank   | Philadelphia |
|  7 | Grace   | San Antonio  |
|  8 | Hannah  | San Diego    |
|  9 | Ian     | Dallas       |
| 10 | Julia   | San Jose     |
+----+---------+--------------+
10 rows in set (0.00 sec)

mysql> truncate table people;
Query OK, 0 rows affected (0.06 sec)

mysql> select * from people;
Empty set (0.00 sec)

#Rename table in sql
mysql> rename table people to employees;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from employees;
Empty set (0.00 sec)

mysql> select * from people;
ERROR 1146 (42S02): Table 'demo_db.people' doesn't exist                    '

#Alter database
Alter database enables you to change the overall characteristics of a database. These characteristics are stored in db.opt file in the database directory. To use ALTER DATABASE, you need the alter privilege on the database.

Alter Schema is a synonym fir Alter Database. The database name can be omitted from the syntax, in which case the statement applies to the default database.

Syntax:- ALTER DATABASE database_name;
Ex:- ALTER DATABASE db;

#DROP DATABASE
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo_db            |
| information_schema |
| karan              |
| mysql              |
| performance_schema |
| rating_System      |
| sys                |
| test               |
+--------------------+
8 rows in set (0.00 sec)

mysql> drop database test;
Query OK, 0 rows affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo_db            |
| information_schema |
| karan              |
| mysql              |
| performance_schema |
| rating_System      |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

#SHOW COLUMNS
mysql> show columns from demo_table;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| stu_id    | int         | YES  |     | NULL    |       |
| name      | varchar(50) | YES  |     | NULL    |       |
| last_name | varchar(50) | YES  |     | NULL    |       |
| roll      | int         | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

#SHOW CREATE DATABASE
Shows the command that we used to write when creating the database
mysql> show create database demo_db;
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
| Database | Create Database                                                                                                                   |
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
| demo_db  | CREATE DATABASE `demo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

#SHOW CREATE TABLE
mysql> show create table employees;
+-----------+---------------------------------------------------------------+
| Table     | Create Table                                                  |
+-----------+---------------------------------------------------------------+
| employees | CREATE TABLE `employees` (                                    |
|  `id` int NOT NULL AUTO_INCREMENT,                                        |
| `name` varchar(50) DEFAULT NULL,                                          |
| `city` varchar(50) DEFAULT NULL,                                          |
| PRIMARY KEY (`id`)                                                        |
| )                                                                         |
| ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci          |
+-----------+---------------------------------------------------------------+
1 row in set (0.00 sec)

#UPDATING RECORDS IN TABLE
mysql> update demo_table3 
set m_no = 787890 
where emp_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

#UPDATE WITH CASE
mysql> update student
    -> set result =
    -> case
    -> when mark >= 300 then 'FIRST'
    -> when mark <300 and mark  >=250 then 'SECOND'
    -> when mark <250 and mark  >=150 then 'THIRD'
    -> else 'FAIL'
    -> end;
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from student;
+------+-------+---------+------+--------+
| stid | name  | city    | mark | result |
+------+-------+---------+------+--------+
|    1 | Rahul | Delhi   |  300 | FIRST  |
|    2 | Rani  | Chennai |  250 | SECOND |
|    3 | Soni  | Ranchi  |  320 | FIRST  |
|    4 | Jai   | Hyd     |  255 | SECOND |
|    5 | Rock  | Mumbai  |  150 | THIRD  |
|    6 | Sonam | Patna   |  145 | FAIL   |
+------+-------+---------+------+--------+
6 rows in set (0.00 sec)

#DELETING A SINGLE RECORD
mysql> delete from student 
    -> where stid = 1;
Query OK, 1 row affected (0.00 sec)

mysql> select * from student;
+------+-------+---------+------+--------+
| stid | name  | city    | mark | result |
+------+-------+---------+------+--------+
|    2 | Rani  | Chennai |  250 | SECOND |
|    3 | Soni  | Ranchi  |  320 | FIRST  |
|    4 | Jai   | Hyd     |  255 | SECOND |
|    5 | Rock  | Mumbai  |  150 | THIRD  |
|    6 | Sonam | Patna   |  145 | FAIL   |
+------+-------+---------+------+--------+
5 rows in set (0.00 sec)

#Copy old table to new table
Within same database
mysql> select * from student;
+------+-------+---------+------+--------+
| stid | name  | city    | mark | result |
+------+-------+---------+------+--------+
|    2 | Rani  | Chennai |  250 | SECOND |
|    3 | Soni  | Ranchi  |  320 | FIRST  |
|    4 | Jai   | Hyd     |  255 | SECOND |
|    5 | Rock  | Mumbai  |  150 | THIRD  |
|    6 | Sonam | Patna   |  145 | FAIL   |
+------+-------+---------+------+--------+
5 rows in set (0.00 sec)

mysql> create table studentoftenth like student;
Query OK, 0 rows affected (0.04 sec)

mysql> insert studentoftenth select * from student;
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from studentoftenth;
+------+-------+---------+------+--------+
| stid | name  | city    | mark | result |
+------+-------+---------+------+--------+
|    2 | Rani  | Chennai |  250 | SECOND |
|    3 | Soni  | Ranchi  |  320 | FIRST  |
|    4 | Jai   | Hyd     |  255 | SECOND |
|    5 | Rock  | Mumbai  |  150 | THIRD  |
|    6 | Sonam | Patna   |  145 | FAIL   |
+------+-------+---------+------+--------+
5 rows in set (0.00 sec)

In Other database
mysql> use demo_db2; (Use the database where you want to create the table)
Database changed

mysql> create table student like demo_db.student; (Creating table)
Query OK, 0 rows affected (0.04 sec)

mysql> insert student select * from demo_db.student; (Inserting data)
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> show tables;
+--------------------+
| Tables_in_demo_db2 |
+--------------------+
| student            |
+--------------------+
1 row in set (0.01 sec)

mysql> select * from student;
+------+-------+---------+------+--------+
| stid | name  | city    | mark | result |
+------+-------+---------+------+--------+
|    2 | Rani  | Chennai |  250 | SECOND |
|    3 | Soni  | Ranchi  |  320 | FIRST  |
|    4 | Jai   | Hyd     |  255 | SECOND |
|    5 | Rock  | Mumbai  |  150 | THIRD  |
|    6 | Sonam | Patna   |  145 | FAIL   |
+------+-------+---------+------+--------+
5 rows in set (0.00 sec)

#MIN and MAX Function
mysql> select min(salary) from employees;
+-------------+
| min(salary) |
+-------------+
|       10000 |
+-------------+
1 row in set (0.00 sec)

mysql> select max(salary) from employees;
+-------------+
| max(salary) |
+-------------+
|       50000 |
+-------------+
1 row in set (0.00 sec)

mysql> select min(salary) as 'MINIMUM SALARY' from employees;
+----------------+
| MINIMUM SALARY |
+----------------+
|          10000 |
+----------------+
1 row in set (0.00 sec)

mysql> select max(salary) as 'MAXIMUM SALARY' from employees;
+----------------+
| MAXIMUM SALARY |
+----------------+
|          50000 |
+----------------+
1 row in set (0.00 sec)

#SUM AND AVG FUNCTION
mysql> select SUM(salary) as 'TOTAL SALARY' from employees;
+--------------+
| TOTAL SALARY |
+--------------+
|       420000 |
+--------------+
1 row in set (0.00 sec)

mysql> select AVG(salary) as 'AVERAGE SALARY' from employees;
+----------------+
| AVERAGE SALARY |
+----------------+
|     28000.0000 |
+----------------+
1 row in set (0.00 sec)

#SQRT FUNCTION
mysql> select salary, sqrt(salary) as 'square root of salary'  from  employees;
+--------+-----------------------+
| salary | square root of salary |
+--------+-----------------------+
|  50000 |    223.60679774997897 |
|  45000 |    212.13203435596427 |
|  15000 |    122.47448713915891 |
|  30000 |    173.20508075688772 |
|  10000 |                   100 |
|  35000 |    187.08286933869707 |
|  35000 |    187.08286933869707 |
|  30000 |    173.20508075688772 |
|  30000 |    173.20508075688772 |
|  35000 |    187.08286933869707 |
|  15000 |    122.47448713915891 |
|  20000 |     141.4213562373095 |
|  20000 |     141.4213562373095 |
|  25000 |    158.11388300841898 |
|  25000 |    158.11388300841898 |
+--------+-----------------------+
15 rows in set (0.00 sec)

#DECIMAL DATATYPE
mysql> create table product 
    -> (
    -> id int auto_increment primary key,
    -> pname varchar (40),
    -> price decimal (7,2) not null
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> desc product;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int          | NO   | PRI | NULL    | auto_increment |
| pname | varchar(40)  | YES  |     | NULL    |                |
| price | decimal(7,2) | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> insert into product (pname,price)
    -> values ("Mobile",69999.55),
    -> ("Computer",16000.56),
    -> ("Laptop",25000.00),
    -> ("Printer",10000.23);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from  product;
+----+----------+----------+
| id | pname    | price    |
+----+----------+----------+
|  1 | Mobile   | 69999.55 |
|  2 | Computer | 16000.56 |
|  3 | Laptop   | 25000.00 |
|  4 | Printer  | 10000.23 |
+----+----------+----------+
4 rows in set (0.00 sec)

Note:- ZEROFILL used to add zero after and before of the data to show that this is price or value.

#ROUND FUNCTION (Basically round ups the data if 2.4 then it is 2 and if 2.5 or 2.5-2.9 then it include it as 3)
mysql> select * , round(price,1) from product;
+----+----------+----------+----------------+
| id | pname    | price    | round(price,1) |
+----+----------+----------+----------------+
|  1 | Mobile   | 69999.55 |        69999.6 |
|  2 | Computer | 16000.56 |        16000.6 |
|  3 | Laptop   | 25000.00 |        25000.0 |
|  4 | Printer  | 10000.23 |        10000.2 |
+----+----------+----------+----------------+
4 rows in set (0.00 sec)

#COUNT FUNCTION
mysql> select count(CustID) from Orders;
+---------------+
| count(CustID) |
+---------------+
|             8 |
+---------------+
1 row in set (0.01 sec)

mysql> select count(distinct CustID) from Orders;
+------------------------+
| count(distinct CustID) |
+------------------------+
|                      3 |
+------------------------+
1 row in set (0.00 sec)

mysql> select count(CustID) from Orders
    -> where custid = 101;
+---------------+
| count(CustID) |
+---------------+
|             3 |
+---------------+
1 row in set (0.00 sec)

#UPPER AND LOWER FUNCTION
mysql> select upper(emp_name) as NAME from employees;
+--------+
| NAME   |
+--------+
| RAM    |
| AMIT   |
| TANU   |
| SUNIL  |
| SONAM  |
| KOMAL  |
| VINAY  |
| DEV    |
| SUHANA |
| PUJA   |
| RAJA   |
| JAI    |
| SONAM  |
| DEV    |
| PUJA   |
+--------+
15 rows in set (0.01 sec)

mysql> select lower(emp_name) as name from employees;
+--------+
| name   |
+--------+
| ram    |
| amit   |
| tanu   |
| sunil  |
| sonam  |
| komal  |
| vinay  |
| dev    |
| suhana |
| puja   |
| raja   |
| jai    |
| sonam  |
| dev    |
| puja   |
+--------+
15 rows in set (0.00 sec)

#MID AND LENGTH FUNCTION
mysql> select mid(city,1,3) as shortcity from employees;
+-----------+
| shortcity |
+-----------+
| Del       |
| Mum       |
| Del       |
| Kol       |
| Kol       |
| Ran       |
| Kol       |
| Mum       |
| Ran       |
| Ban       |
| Pat       |
| Che       |
| J&K       |
| Che       |
| Mum       |
+-----------+
15 rows in set (0.00 sec)

mysql> select city, Length(city) from employees;
+----------+--------------+
| city     | Length(city) |
+----------+--------------+
| Delhi    |            5 |
| Mumbai   |            6 |
| Delhi    |            5 |
| Kolkata  |            7 |
| Kolkata  |            7 |
| Ranchi   |            6 |
| Kolkata  |            7 |
| Mumbai   |            6 |
| Ranchi   |            6 |
| Banglore |            8 |
| Patna    |            5 |
| Chennai  |            7 |
| J&K      |            3 |
| Chennai  |            7 |
| Mumbai   |            6 |
+----------+--------------+
15 rows in set (0.00 sec)

#CONCAT FUNCTION
mysql> select emp_name, concat(city,' ',pin) as concat from employees;
+----------+-----------------+
| emp_name | concat          |
+----------+-----------------+
| Ram      | Delhi 800001    |
| Amit     | Mumbai 800002   |
| Tanu     | Delhi 800001    |
| Sunil    | Kolkata 800003  |
| Sonam    | Kolkata 800003  |
| Komal    | Ranchi 800004   |
| Vinay    | Kolkata 800003  |
| Dev      | Mumbai 800002   |
| Suhana   | Ranchi 800004   |
| Puja     | Banglore 800005 |
| Raja     | Patna 800007    |
| Jai      | Chennai 800009  |
| Sonam    | J&K 800008      |
| Dev      | Chennai 800009  |
| Puja     | Mumbai 800002   |
+----------+-----------------+
15 rows in set (0.01 sec)

#REVERSE FUNCTION
mysql> select reverse (city) from employees;
+----------------+
| reverse (city) |
+----------------+
| ihleD          |
| iabmuM         |
| ihleD          |
| atakloK        |
| atakloK        |
| ihcnaR         |
| atakloK        |
| iabmuM         |
| ihcnaR         |
| erolgnaB       |
| antaP          |
| iannehC        |
| K&J            |
| iannehC        |
| iabmuM         |
+----------------+
15 rows in set (0.00 sec)

#NOW FUNCTION
mysql> select emp_name, salary, NOW() as DateTime from employees;
+----------+--------+---------------------+
| emp_name | salary | DateTime            |
+----------+--------+---------------------+
| Ram      |  50000 | 2025-11-13 23:02:39 |
| Amit     |  45000 | 2025-11-13 23:02:39 |
| Tanu     |  15000 | 2025-11-13 23:02:39 |
| Sunil    |  30000 | 2025-11-13 23:02:39 |
| Sonam    |  10000 | 2025-11-13 23:02:39 |
| Komal    |  35000 | 2025-11-13 23:02:39 |
| Vinay    |  35000 | 2025-11-13 23:02:39 |
| Dev      |  30000 | 2025-11-13 23:02:39 |
| Suhana   |  30000 | 2025-11-13 23:02:39 |
| Puja     |  35000 | 2025-11-13 23:02:39 |
| Raja     |  15000 | 2025-11-13 23:02:39 |
| Jai      |  20000 | 2025-11-13 23:02:39 |
| Sonam    |  20000 | 2025-11-13 23:02:39 |
| Dev      |  25000 | 2025-11-13 23:02:39 |
| Puja     |  25000 | 2025-11-13 23:02:39 |
+----------+--------+---------------------+
15 rows in set (0.00 sec)

#GROUP BY FUNCTION
mysql> select emp_name, MIN(salary) from employees group by emp_name;
+----------+-------------+
| emp_name | MIN(salary) |
+----------+-------------+
| Ram      |       50000 |
| Amit     |       45000 |
| Tanu     |       15000 |
| Sunil    |       30000 |
| Sonam    |       10000 |
| Komal    |       35000 |
| Vinay    |       35000 |
| Dev      |       25000 |
| Suhana   |       30000 |
| Puja     |       25000 |
| Raja     |       15000 |
| Jai      |       20000 |
+----------+-------------+
12 rows in set (0.00 sec)

mysql> select custid, count(*) from Orders group by custid;
+--------+----------+
| custid | count(*) |
+--------+----------+
|    101 |        3 |
|    102 |        2 |
|    103 |        3 |
+--------+----------+
3 rows in set (0.00 sec)

#HAVING CLAUSE
mysql> select emp_name, min(salary) from employees group by emp_name having min(salary) > 25000;
+----------+-------------+
| emp_name | min(salary) |
+----------+-------------+
| Ram      |       50000 |
| Amit     |       45000 |
| Sunil    |       30000 |
| Komal    |       35000 |
| Vinay    |       35000 |
| Suhana   |       30000 |
+----------+-------------+
6 rows in set (0.00 sec)

#ONE-TO-ONE RELATIONSHIP
+-------------+        +-------------+
|   USERS     |        | USER_PROFILE|
+-------------+        +-------------+
| id (PK)     |<------>| user_id (PK, FK)
| username    |        | bio
| email       |        | avatar_url
+-------------+        +-------------+

Explanation:
One user has exactly one profile, and one profile belongs to exactly one user.

#ONE-TO-MANY RELATIONSHIP
+-------------+        +-------------+
|  CUSTOMERS  |        |   ORDERS    |
+-------------+        +-------------+
| id (PK)     |<------>| customer_id (FK)
| name        |        | order_date
| email       |        | amount
+-------------+        +-------------+

Explanation:
One customer can have many orders, but each order belongs to one customer.

#MANY-TO-MANY RELATIONSHIP
+-------------+        +-----------------+        +-------------+
|  STUDENTS   |        | STUDENT_COURSES |        |   COURSES   |
+-------------+        +-----------------+        +-------------+
| id (PK)     |<------>| student_id (FK) |------->| id (PK)
| name        |        | course_id  (FK) |<-------| title
| major       |        +-----------------+        | credits
+-------------+                                     +-------------+

Explanation:
A student can enroll in many courses and a course can have many students.
NOTE :- IN THIS RELATIONSHIP WE HAVE TO CREATE A JUNCTION TABLE TO MAKE CONNECTIVITY BETWEEN OR AMONG BOTH TABLES.

#NF (NORMALISATION FORM)
USED TO REMOVE REDUNDANCY OF THE TABLE
