create database finance;
use finance;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15)
);


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2),
    transaction_date DATETIME,
    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);
INSERT INTO customers (customer_id, name, email, phone) VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876543210'),
(2, 'Anu Joseph', 'anu@gmail.com', '9876543211'),
(3, 'Rahul Nair', 'rahul@gmail.com', '9876543212'),
(4, 'Meera Das', 'meera@gmail.com', '9876543213'),
(5, 'Vishnu Raj', 'vishnu@gmail.com', '9876543214'),
(6, 'Sneha Menon', 'sneha@gmail.com', '9876543215'),
(7, 'Akhil Das', 'akhil@gmail.com', '9876543216'),
(8, 'Neha Paul', 'neha@gmail.com', '9876543217');
INSERT INTO accounts
(account_id, customer_id, account_type, balance) VALUES
(101, 1, 'Savings', 150000.00),
(102, 1, 'Current', 75000.00),

(103, 2, 'Savings', 250000.00),
(104, 2, 'Current', 120000.00),

(105, 3, 'Savings', 80000.00),

(106, 4, 'Savings', 175000.00),
(107, 4, 'Current', 50000.00),

(108, 5, 'Savings', 95000.00),

(109, 6, 'Savings', 300000.00),

(110, 7, 'Savings', 45000.00),

(111, 8, 'Savings', 125000.00),
(112, 8, 'Current', 60000.00);
INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date) VALUES

(1001, 101, 'Deposit',    50000.00, '2026-01-05 10:00:00'),
(1002, 101, 'Withdrawal', 10000.00, '2026-01-10 11:30:00'),
(1003, 101, 'Deposit',    25000.00, '2026-01-15 09:45:00'),

(1004, 102, 'Deposit',    30000.00, '2026-01-08 12:00:00'),
(1005, 102, 'Withdrawal',  5000.00, '2026-01-18 14:30:00'),

(1006, 103, 'Deposit',   100000.00, '2026-01-03 10:15:00'),
(1007, 103, 'Withdrawal', 20000.00, '2026-01-12 13:00:00'),
(1008, 103, 'Deposit',    50000.00, '2026-02-01 09:30:00'),

(1009, 104, 'Deposit',    75000.00, '2026-01-07 11:00:00'),

(1010, 105, 'Deposit',    40000.00, '2026-01-09 15:00:00'),
(1011, 105, 'Withdrawal', 10000.00, '2026-01-20 16:00:00'),

(1012, 106, 'Deposit',    60000.00, '2026-01-04 10:30:00'),
(1013, 106, 'Withdrawal', 15000.00, '2026-01-14 12:45:00'),

(1014, 107, 'Deposit',    20000.00, '2026-01-22 10:00:00'),

(1015, 108, 'Deposit',    30000.00, '2026-01-11 09:00:00'),

(1016, 109, 'Deposit',   150000.00, '2026-01-02 11:30:00'),
(1017, 109, 'Withdrawal', 25000.00, '2026-01-17 13:15:00'),
(1018, 109, 'Deposit',    50000.00, '2026-02-05 10:45:00'),

(1019, 110, 'Deposit',    15000.00, '2026-01-25 14:00:00'),

(1020, 111, 'Deposit',    45000.00, '2026-01-06 12:30:00'),
(1021, 111, 'Withdrawal',  5000.00, '2026-01-16 15:30:00'),

(1022, 112, 'Deposit',    25000.00, '2026-01-13 10:00:00');

SHOW TABLES;

SELECT * FROM customers;
SELECT * FROM accounts;
SELECT * FROM transactions;
-- TASK QUESTIONS 
/*1. Display all customers and their account details.
  2. Find accounts whose balance is greater than 100,000.
  3. Count the number of accounts held by each customer.
  4. Calculate the total account balance for each customer.
  5. Display all transactions for a particular account.
  6. Calculate total deposits and withdrawals separately.
  7. Find the customer with the highest total account balance.
  8. Display customers who have more than one account.
  9. Join Customers, Accounts, and Transactions to display customer, account, and transaction details.
  10. Find the average transaction amount for each account.
  11. Find accounts that have no transactions using LEFT JOIN.
  12. Find the latest transaction for each account using ROW_NUMBER().
  13. Create a running transaction total using SUM() OVER(ORDER BY transaction_date).
  14. Use a CTE to calculate total transaction amount per customer.
  15. Rank customers according to total account balance using RANK() or DENSE_RANK().
*/
-- TASK ANSWERS
SELECT * FROM customers;
SELECT * FROM accounts;
select * from accounts where balance>100000;
select c.customer_id,c.name,count(a.account_id) as accounts from accounts a inner join customers c on c.customer_id=a.customer_id group by a.customer_id;
select c.customer_id,c.name,sum(balance) as balance from accounts a inner join customers c on c.customer_id=a.customer_id group by a.customer_id;
select * from transactions where account_id=101;
select transaction_type,sum(amount) as total from transactions group by transaction_type;
select sum(case when transaction_type="Deposit" then amount else 0 end) as total_deposits,sum(case when transaction_type="Withdrawal" then amount else 0 end) as total_withdrawal from transactions;
select c.customer_id,c.name,sum(balance) as balance from accounts a inner join customers c on c.customer_id=a.customer_id group by a.customer_id order by balance desc limit 1;
select c.customer_id,c.name,count(a.account_id) as accounts from accounts a inner join customers c on c.customer_id=a.customer_id group by customer_id having count(a.account_id)>1;
select
    c.customer_id,
    c.name,
    c.email,
    c.phone,
    a.account_id,
    a.account_type,
    a.balance,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
from customers c
join accounts a
    on c.customer_id = a.customer_id
join transactions t
    on a.account_id = t.account_id;
select account_id,avg(amount) as avg_transaction from transactions group by account_id;
select a.account_id,count(t.transaction_id) as transactions from accounts a left join transactions t on t.account_id=a.account_id group by account_id having count(t.transaction_id)=0;
select transaction_id,account_id,amount,transaction_date,rank() over(partition by account_id order by transaction_date desc) as latest_transaction from transactions; 
select transaction_id,amount,transaction_date,sum(amount) over(order by transaction_date) as running_total_transation from transactions;
with total_transaction as(
select c.customer_id,c.name,sum(t.amount) as total_amount from customers c join accounts a on c.customer_id=a.customer_id join transactions t on a.account_id=t.account_id group by c.customer_id, c.name
)select * from total_transaction;
select *,rank() over(order by total desc) as Ranks from(select c.customer_id,c.name,sum(balance) as total from accounts a join customers c on a.customer_id=c.customer_id group by customer_id) as temp;


# Tasks of finance database completed
##########################################################################################
