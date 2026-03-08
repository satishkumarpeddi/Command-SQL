create table employees(
    employee_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(50),
    hire_date DATE
);
select *from employees;

rename table employees to workers;
rename table workers to employees;

drop table employees;

alter table employees add phone_number varchar(15);

select * from employees;

alter table employees change column phone_number email varchar(20);

alter table employees modify column email varchar(100);

alter table employees modify email varchar(100) after  last_name;

select * from employees;

alter table employees add column hourly_pate INT;

select * from employees;

alter table employees drop column hourly_pate;

insert into employees values(1,"Satish","Kumar","anonymous1986222@gmail.com","2026-03-8");

select * from employees where first_name = "Satish";

update employees set first_name = "name";

select *from employees;

commit;

select *from employees;

rollback;

delete from employees;

select * from employees;

create table products(
    product_id int,
    product_name varchar(25),
    price decimal(4,2);
);

alter table products add constraint unique(product_name);

select * from products;

insert into products  values (100, "hamburger", 3.99),
	   (101, "fries", 1.89),
       (102, "soda", 1.00),
       (103, "ice cream", 1.49);

select * from products;

insert into products (101,"ice cream",12);

alter table employees add column hourly_rate int;

alter table employees add constraint check(hourly_rate>=10.00);

insert into employees values (1,"Satish","Kumar","anonymous1986222@gmail.com","2026-03-8");

select * from employees where hourly_rate;

create table customers(
    customer_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50)
);

select *from customers;

insert into customers(first_name,last_name) values ("Fred","Fish"),("Larry","Bash"),("Hey hey","Boy");

create table transactions(
    transaction_id int primary key auto_increment,
    amount decimal(5,2),
    customer_id int,
    foreign key(customer_id) references  customers(customer_id)
);

select *from transactions;

alter table transactions drop froegin key transactions_ibfk_2;

alter table transctions add constraint transaction_fk foreign key(customer_id) references customers(customer_id);

select * from customers;

insert into customers values (5,"Satish","Kumar");

insert into transactions (amount,customer_id) values (200,3),(2003,2),(2001,1);

select transaction_id , amount, first_name , last_name from transactions right join customers on transactions.customer_id = customers.customers_id;

select * from transactions;

select count(amount) as todays_transaction from transactions;

select max(amount) as maximum from transactions;

select min(amount) as maximum from transactions;

select sum(amount) as total_sales from transactions;

select concat(first_name," + ",last_name) as full_name from employees;

alter table employees add column jobs varchar(25) after hourly_rate;

select * from employees;

update employees set jobs= "manager" where employee_id = 1;

select * from employees where last_name like "k%";

select * from transactions order by amount,customer_id limit 3;

select first_name, last_name from employees union select first_name,last_name from customers;

select first_name ,last_name from employees union all select first_name ,last_name from customers;

alter table customers drop column refral_id;

insert into transactions (amount,customer_id) values (389,1);

select count(amount), customer_id from transactions group by customer_id having count(amount)>=3;

select count(amount), customer_id from transactions group by customer_id having count(amount)>=3;

select * from transactions as t, customers as c, where t.customer_id = c.customer_id and not t.amount>400;

select * from transactions;
