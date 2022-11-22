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

select * from person;

Delete From person
Where gender = 'Male' and country_of_birth = 'Indonesia' and id = 2022;

select * From person
Where gender = 'Female' and country_of_birth = 'Indonesia' and id = 2022;

Delete From person
Where gender = 'Male';

Delete From person;

--Update Records

select * from person Where id = 3010;

Update person
Set email = 'ommar@gmail.com'
Where id = 3012;

Update person
Set first_name = 'Omar',last_name = 'Montana',email = 'ommar.montana@hotmail.com'
Where id = 3010;

--On Conflict Do Nothing
select * from person;

select * from person
where id = 3013;

Insert into person (id,first_name,last_name,gender,email,date_of_birth,country_of_birth)
Values (3013,'Raffaello','Gilhouley','Male','rgilhouley3@netscape.com',DATE '2021-12-24','China');

--Email or id because these columns have a constraint
Insert into person (id,first_name,last_name,gender,email,date_of_birth,country_of_birth)
Values (3013,'Raffaello','Gilhouley','Male','rgilhouley3@netscape.com',DATE '2021-12-24','China')
On Conflict (email /* or id*/) Do Nothing;

--Upsert
Insert into person (id,first_name,last_name,gender,email,date_of_birth,country_of_birth)
Values (3013,'Raffaello','Gilhouley','Male','rgilhouley3@netscape.com',DATE '2021-12-24','China')
On Conflict (email) Do Nothing;

select * from person Where id = 3013;

--Adding Relationship Between Tables
--Drop Table person;
--Drop Table car;

create table car (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

create table person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7) NOT NULL,
    email VARCHAR(1000),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);

insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('Fernanda','Beardon','Female','fernandab@is.gd','1953-10-28','England');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('Omar','Colmore','Male',null,'1921-04-03','Finland');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('Adriana','Matuscheck','Female','amatuschek2@feedburner.com','1989-10-28','USA');

insert into car (make,model,price) values ('Land Rover','Sterling','87665.38');
insert into car (make,model,price) values ('GMC','Acadia','17662.69');

select * from person;
select * from car;

--Updating Foreign Keys Columns
select * from person;

select * from car;

Update person
Set car_id = 3
Where id = 1;



--Updating Foreign Keys Columns
select * from person;

select * from car;

Update person
Set car_id = 3
Where id = 1;

--Inner Joins
Select * From person;

Select * from car;

select * from person
join car on person.car_id = car.id;

select person.first_name,car.make,car.model,car.price from person
join car on person.car_id = car.id;

--Left Joins
select * from person;
select * from car;

select * from person
left join car on car.id = person.car_id;

Select * from person 
left join car on car.id = person.car_id;

--Deleting Records With Foreign Keys
select * from person;
select * from car;
Insert Into car (id,make,model,price) values (13, 'Mazda', 'RX-8','51272.48');
Insert Into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (9000,'John','Smith','Male',null, '1921-04-03', 'Finland');

Select * From person
Where id = 9000;

Select * from car
Where id = 13;

Update person
Set car_id = 13
where id = 9000;

Delete From car
Where id = 13;

Delete From person
Where id = 9000;

Delete From car
Where id = 13;

--Exporting Query Results to CSV
Select * from person
Left Join car on car.id = person.car_id;

\copy (Select * From person left join car on car.id = person.car_id) To 'C:\Users\javoh\Desktop\results.csv' delimiter ',' csv header;

--Serial & Sequences
Select * from person_id_seq;

select * from person;

select nextval('person_id_seq'::regclass);
select nextval('person_id_seq'::regclass);
select nextval('person_id_seq'::regclass);

select * from person;
Select * from person_id_seq;


insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('John','Matuscheck','Male','john@feedburner.com','1989-02-28','France');

select * from person;


Alter Sequence person_id_seq Restart With 10;

select * from person_id_seq;

Alter Sequence person_id_seq Restart With 9;

select * from person_id_seq;

select nextval('person_id_seq'::regclass)
select nextval('person_id_seq'::regclass)
select nextval('person_id_seq'::regclass)

--Extensions
select * from pg_available_extensions;

--Universally unique identifier
select * from pg_available_extensions
order by name;

Create Extension If Not Exists "uuid-ossp";

select uuid_generate_v4();


Drop Table person;
Drop Table car;


create table car (
    car_uid UUID NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL CHECK (price > 0)
);

create table person (
    person_uid UUID NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_uid UUID REFERENCES car (car_uid),
    UNIQUE(car_uid),
    UNIQUE(email)
);

--Insert into person
insert into person (person_uid,first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (uuid_generate_v4(),'Fernanda','Beardon','Female','fernandab@is.gd', '1953-10-28', 'Comoros');

insert into person (person_uid,first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (uuid_generate_v4(),'Omar','Colmore','Male',null, '1921-04-03', 'Finland');

insert into person (person_uid,first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (uuid_generate_v4(),'Adriana','Matuschek','Female','amatuschek2@feedburner.com', '1965-02-28', 'Cameroon');

--insert into car
insert into car (car_uid,make,model,price) values (uuid_generate_v4(),'Land Rover', 'Sterling', '87665.38');
insert into car (car_uid,make,model,price) values (uuid_generate_v4(),'GMC', 'Acadia', '17662.69');

select * from person;
select * from car;

Update person
Set car_uid = '9ebf6417-5ecd-4d53-ac6c-39c141085d75'
where person_uid = 'dc4f3296-40ff-4172-9ecd-ec959d98dd9b';

Update person
Set car_uid = '5c925b79-c991-45c9-8a0f-705dba355017'
where person_uid = 'd8228034-086b-433a-8a3f-0d309e6bc493';

select * from person
join car on person.car_uid = car.car_uid;

select * from person
left join car using (car_uid)
where car.* is null;
