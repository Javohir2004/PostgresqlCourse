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


















