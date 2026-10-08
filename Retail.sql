create database retail;
use retail;
create table customers(
customer_id int primary key,
name varchar(25),
email varchar(25),
phone varchar(25)
);
create table orders(
order_id int primary key,
customer_id int,
order_date datetime,
total_amount decimal(5,2),
foreign key(customer_id)
references customers(customer_id));
create table payment(
payment_id int primary key,
order_id int,
payment_method varchar(25),
payment_date datetime,
foreign key(order_id)
references orders(order_id));
create table product(
product_id int primary key,
name varchar(25),
price decimal(5,2),
stock_quantity int
);
create table order_item(
order_item_id int primary key,
order_id int,
product_id int,
quantity int,
price_at_purchase decimal,
foreign key(order_id)
references orders(order_id),
foreign key(product_id)
references product(product_id)
);
ALTER TABLE orders
MODIFY total_amount DECIMAL(10,2);
ALTER TABLE product
MODIFY price DECIMAL(10,2);
INSERT INTO customers (customer_id, name, email, phone) VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876543210'),
(2, 'Anu Joseph', 'anu@gmail.com', '9876543211'),
(3, 'Rahul Nair', 'rahul@gmail.com', '9876543212'),
(4, 'Meera Das', 'meera@gmail.com', '9876543213'),
(5, 'Vishnu Raj', 'vishnu@gmail.com', '9876543214'),
(6, 'Sneha Menon', 'sneha@gmail.com', '9876543215'),
(7, 'Akhil Das', 'akhil@gmail.com', '9876543216'),
(8, 'Neha Paul', 'neha@gmail.com', '9876543217');
INSERT INTO product (product_id, name, price, stock_quantity) VALUES
(101, 'Laptop', 55000.00, 20),
(102, 'Smartphone', 25000.00, 35),
(103, 'Headphones', 1500.00, 50),
(104, 'Keyboard', 1200.00, 40),
(105, 'Mouse', 800.00, 60),
(106, 'Monitor', 15000.00, 25),
(107, 'Tablet', 30000.00, 15),
(108, 'Smartwatch', 5000.00, 30);
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 1, '2026-01-10 10:30:00', 56500.00),
(1002, 2, '2026-01-12 11:00:00', 25000.00),
(1003, 1, '2026-01-15 14:20:00', 15800.00),
(1004, 3, '2026-01-18 16:00:00', 30000.00),
(1005, 4, '2026-01-20 12:30:00', 6500.00),
(1006, 1, '2026-01-22 13:15:00', 1200.00),
(1007, 5, '2026-01-25 15:00:00', 55000.00),
(1008, 2, '2026-02-01 10:00:00', 16500.00),
(1009, 6, '2026-02-05 11:45:00', 30000.00),
(1010, 1, '2026-02-08 17:30:00', 5800.00),
(1011, 7, '2026-02-10 14:00:00', 25000.00),
(1012, 3, '2026-02-15 16:30:00', 15000.00),
(1013, 1, '2026-02-20 12:00:00', 30000.00),
(1014, 8, '2026-02-25 13:30:00', 55000.00);
INSERT INTO order_item
(order_item_id, order_id, product_id, quantity, price_at_purchase) VALUES
(1,  1001, 101, 1, 55000.00),
(2,  1001, 103, 1, 1500.00),

(3,  1002, 102, 1, 25000.00),

(4,  1003, 106, 1, 15000.00),
(5,  1003, 105, 1, 800.00),

(6,  1004, 107, 1, 30000.00),

(7,  1005, 108, 1, 5000.00),
(8,  1005, 105, 1, 800.00),
(9,  1005, 104, 1, 1200.00),

(10, 1006, 104, 1, 1200.00),

(11, 1007, 101, 1, 55000.00),

(12, 1008, 106, 1, 15000.00),
(13, 1008, 104, 1, 1200.00),
(14, 1008, 105, 1, 800.00),

(15, 1009, 107, 1, 30000.00),

(16, 1010, 108, 1, 5000.00),
(17, 1010, 105, 1, 800.00),

(18, 1011, 102, 1, 25000.00),

(19, 1012, 106, 1, 15000.00),

(20, 1013, 107, 1, 30000.00),

(21, 1014, 101, 1, 55000.00);

INSERT INTO payment
(payment_id, order_id, payment_method, payment_date) VALUES
(501, 1001, 'UPI', '2026-01-10 10:35:00'),
(502, 1002, 'Credit Card', '2026-01-12 11:05:00'),
(503, 1003, 'Debit Card', '2026-01-15 14:25:00'),
(504, 1004, 'UPI', '2026-01-18 16:05:00'),
(505, 1005, 'Cash', '2026-01-20 12:35:00'),
(506, 1006, 'UPI', '2026-01-22 13:20:00'),
(507, 1007, 'Credit Card', '2026-01-25 15:05:00'),
(508, 1008, 'UPI', '2026-02-01 10:05:00'),
(509, 1009, 'Debit Card', '2026-02-05 11:50:00'),
(510, 1010, 'UPI', '2026-02-08 17:35:00'),
(511, 1011, 'Credit Card', '2026-02-10 14:05:00'),
(512, 1012, 'UPI', '2026-02-15 16:35:00'),
(513, 1013, 'Debit Card', '2026-02-20 12:05:00'),
(514, 1014, 'Credit Card', '2026-02-25 13:35:00');
show tables;
select * from customers;
select * from order_item;
select * from orders;
select * from payment;
select * from product;
-- TASK QUESTIONS 
/*1. Display all customers.
 2. Display products whose price is greater than 1,000.
 3. Find the total number of customers.
 4. Find the number of products in each category using GROUP BY.
 5. Display all orders placed by a particular customer.
 6. Join Customers and Orders to display customer name, order ID, and order date.
 7. Calculate the total sales amount.
 8. Find the top 5 products based on total sales.
 9. Find customers who have placed more than 3 orders using GROUP BY and HAVING.
 10. Find the total sales for each store.
 11. Find the average order value for each customer.
 12. Find customers who have never placed an order using LEFT JOIN.
 13. Find the highest-priced product in each category using RANK().
 14. Create a running total of sales using SUM() OVER(ORDER BY order_date).
 15. Use a CTE to calculate total sales per customer and display customers whose total sales exceed 50,000. */

-- TASK ANSWERS
select * from customers;
select * from product where price>1000;
select count(*) as total_customers from customers;
select * from orders where customer_id=1;
select name,order_id,order_date from customers c inner join orders o on c.customer_id=o.customer_id;
select sum(total_amount) as total_sales_amount from orders;
select name from orders o inner join order_item oi on o.order_id=oi.order_id inner join product p on oi.product_id=p.product_id group by name;
select p.product_id,p.name,sum(oi.quantity*oi.price_at_purchase) as total_sales from order_item oi inner join product p on oi.product_id=p.product_id group by p.name,p.product_id order by total_sales desc limit 5;
select c.name,count(c.customer_id) from customers c inner join orders o on c.customer_id=o.customer_id group by  o.customer_id having count(c.customer_id)>3;
select c.name,avg(o.total_amount) as avg_amount from customers c inner join orders o on c.customer_id=o.customer_id group by c.customer_id,c.name;
select c.customer_id,c.name from customers c left join orders o on c.customer_id = o.customer_id where o.order_id is null;
select name,price,rank() over(order by price desc) from product limit 1;
select order_id,order_date,total_amount,sum(total_amount) over(order by order_date) as running_total from orders;
with total_sales as(
select c.customer_id,c.name,sum(o.total_amount) as total_sales from customers c inner join orders o on c.customer_id = o.customer_id group by c.customer_id,c.name
)
select * from total_sales where total_sales>50000;


# Tasks of Retail database completed
##########################################################################################

