--MAX,MIN functions
select * from car;

select MAX(price) from car;

select MIN(price) from car;

select AVG(price) from car;

select ROUND(AVG(price)) from car;

select make,model,MIN(price) from car
group by make,model;

select make,model,MAX(price) from car
group by make,model;

select make,MAX(price) from car
group by make;

select make,MIN(price) from car
group by make;

select make,AVG(price) from car
group by make;

--SUM function
select sum(price) from car;

select make,sum(price) from car
group by make;

--Arithmetic Operators
select 10 + 2;

select 10 - 8;

select 10 * 2 + 8;

select 10 * 2 + 8;

select 10 / 2;

select 10 / 3;

select 10^2;

select 5^2;

select 5!;

select 10 % 3;

select 10 % 4;

select 10 % 6;

--Arithmetic Operators (ROUND)
select * from car;

select id, make, model, price from car;

select id, make, model, price, ROUND(price * .10,2) from car;

select id, make, model, price, ROUND(price * .10,2), ROUND(price - (price * .10),2) from car;

--Alias Name

select id, make, model, price AS original_price, ROUND(price * .10,2) AS ten_percent, 
ROUND(price - (price * .10),2) AS discount_after_10_percent from car;

--Coalesce function

select COALESCE(1);

select COALESCE(1) AS number;

select COALESCE(null, 1) AS number;

select COALESCE(null, null, 1, null, 10) AS number;

select * from person;

select email from person;

select COALESCE(Null);

select COALESCE(email,'Email not provided') from person;

--NULLIF function
--If first_argument = second_argument result will be NULL, otherwise result will be first_argument

select 10 / 0;

select NULLIF(10,10);

select NULLIF(10, 19);

select NULLIF('Salom','Salom1');

select 10 / NULL;

select 10 / NULLIF(0, 0);

select COALESCE(10 / NULLIF(0,0),0)

--TimeStamps and Dates

select NOW();

select NOW()::DATE;

select NOW()::TIME;

select NOW() - INTERVAL '1 YEAR';

select NOW() - INTERVAL '2 MONTH';

select NOW() - INTERVAL '3 WEEK';

select NOW() - INTERVAL '1 DAY';

select NOW() + INTERVAL '1 YEAR';

select NOW() + INTERVAL '2 MONTH';

select NOW() + INTERVAL '3 WEEK';

select NOW() + INTERVAL '1 DAY';

--Extracting Fields From TimeStamp
select NOW();

select EXTRACT(YEAR From NOW());

select EXTRACT(MONTH From NOW());

select EXTRACT(DAY From NOW());

select EXTRACT(DOW From NOW());

select EXTRACT(CENTURY From NOW());

--Age Function
select first_name,last_name,gender,country_of_birth,date_of_birth, AGE(NOW(), date_of_birth) AS Age
from person;

--PRIMARY KEYS
select * from person LIMIT 1;

--We can't insert these values into person table, because id column receive only unique values!!
Insert Into person values
(1,'Kris','Wren','kwren02ehow.com','Male',DATE '2022-03-11','Albania')

Alter Table person
Drop Constraint person_pkey;

--We can insert these values into person table after delete PRIMARY KEY with ALTER TABLE!!
Insert Into person values
(1,'Kris','Wren','kwren02ehow.com','Male',DATE '2022-03-11','Albania')

select * from person
where id = 1;

--Adding PRIMARY KEY Constraint

--We can't add Primary Key our table, because id column is not unique!!
Alter Table person
Add PRIMARY KEY (id);

Delete From person
Where id = 1;

--We can add Primary Key to person table,after delete duplicate values!!
Alter Table person
Add PRIMARY KEY (id);

--Unique Constraints
Select email,count(*) from person
Group By email
Having Count(*) > 1;

Insert Into person (first_name,last_name,email,gender,date_of_birth,country_of_birth) values
('Fernando','Wren','kwren02ehow.com','Male',DATE '2022-03-11','Albania')

select * from person
where email = 'kwren02ehow.com'

--We can't add Unique Constraint, because email is not unique
Alter Table person
Add Constraint Unique_Email_Address UNIQUE (email);

Delete From person
where id = 1004

--We can add Unique Constraint, after delete duplicate emails from person table
Alter Table person
Add Constraint Unique_Email_Address UNIQUE (email);

Alter Table person
Drop Constraint Unique_Email_Address;

Alter Table person
Add Unique (email);


--Check Constraints

select * from person;

Insert Into person (first_name,last_name,email,gender,date_of_birth,country_of_birth) values
('Fernando','Wren','hello.com','Male',DATE '2022-03-11','Albania');

select distinct gender from person;

Alter Table person
Add Constraint gender_constraint CHECK (gender = 'Female' or gender = 'Male');

Alter Table person
Drop Constraint gender_constraint;

Delete From person
Where gender <> 'Male' And gender <> 'Female'

--Delete Records
Delete From person;

Delete From person
Where id = 2011

Delete From person
Where gender = 'Female' and country_of_birth = 'England';




















