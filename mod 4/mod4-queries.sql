-- select all columns, all rows
select * from customer where state = 'OH' order by name desc;
													-- desc return in descending order

-- select al columns for cusomters in OH
select * from customer where state = 'OH'; 


-- select name and credit limit columns, all rows, using table alias
select c.name 'Name', c.creditLimit as 'Credit Limit' from customer c;

-- putting c or .c runs it from customer c
-- select customer.name means from customer, abbreviate it to c. same for order as o.
-- from clause tells it to take from [name] table, and the letter after it is the identifier

-- customer.id ... the id cell inside customer table


-- sum and have view by customer
select customerid, sum(total) 'Total'
 from orders group by customerid
 -- having sum(total) > 1000
 having Total > 1000;


-- 7 customers x 11 orders returned

-- 11 rows then returned to show just orders from specific customers
select * from customer join orders on customer.id = orders.customerID;

-- add alias
select * from customer c join orders o on c.id = o.customerID;

-- join view - report format - customer name, order date, and total - subselect
select c.name 'Customer Name', DATE_FORMAT (o.date, "%M, %d, %Y") 'Order Date', concat('$',o.total) as 'Order Total'
from orders o 
join customer c
on c.id=customerID
where o.total > (select avg(total) from orders
)
order by c.name
;

-- ^ showing us the orders by matching the customer ID to the id in customer table
-- ^also showing subquery where o.total > (select avg(total) from orders [don't use alias here cuz it's a new select]

-- get the avg order total
select avg(total) from orders;


-- get the sum of all orders
select sum(total) from orders;

-- get the sum of all orders by customer
select o.customerID, c.name 'Customer Name', sum(o.total) 
from orders o
join customer c on c.id=customerID
group by customerID;

-- customer name and order total

select o.customerID 'Cust. ID', c.name 'Customer Name', sum(o.total) 'Order Total'
from orders o
join customer c on c.id=customerID
group by customerID 
order by name;

-- count function
select count(*)
from orders; 

-- max, min
select max(o.total) from orders o;

-- select a row by id
select * from customer where id = 5;

-- insert a  new single row to the table
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('abc', 'efg', 'dy', 0, 900000);


insert into customer values ('aa2', 'dsfa', 'DH', 0, 098796);

-- 3rd way to insert.. .multiple rows
insert into customer (name, city, state, isCorpAcct, creditLimit) 
values
 ('dummy3', 'dummy3', 'dy', 0, 333),
 ('dummy3', 'dummy3', 'dy', 0, 333),
 ('dummy3', 'dummy3', 'dy', 0, 333);
 
 select * from customer;
 
 -- when you update or delete, you always want to do it by the ID
 update customer 
 set name = "dummy2" 
 where id = 8;

-- selecting deleting or inserting multiple rows 
delete from customer
where id  > 7;