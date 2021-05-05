show databases;
use classicmodels;
show tables;
desc employees;
desc offices;
-- q1
select employees.firstName,employees.lastName, offices.city from offices inner join  employees on offices.officeCode= employees.officeCode;

-- q2
desc Customers;
desc payments;
select *;
select c.customerName,c.customerNumber, p.amount from Customers as c inner join payments as p on c.customerNumber=p.customerNumber and p.amount> 25000;
-- q3
desc orderdetails;
select Customers.customerNumber,products.productName,orderdetails.quantityOrdered from Customers inner join orders inner join orderdetails inner join products on Customers.customerNumber=orders.customerNumber and orders.orderNumber=orderdetails.orderNumber and orderdetails.productCode=products.productCode and orderdetails.quantityOrdered >30 ;
-- q4
select Customers.customerName,orders.orderdate from Customers inner join orders on Customers.customerNumber=orders.customerNumber and orders.status='shipped';


-- q5
select Customers.customerName from Customers inner join payments on Customers.customerNumber=payments.customerNumber and payments.amount>8000 ;
-- q6
select  employees.firstName,employees.lastName from offices inner join  employees on offices.officeCode= employees.officeCode and employees.jobTitle='Sales Rep' and offices.country='USA';
-- q7
select * from offices inner join  employees where offices.officeCode= employees.officeCode and offices.city='sydney';
-- q8
select Customers.customerName,orders.orderdate from Customers inner join orders on Customers.customerNumber=orders.customerNumber and orders.orderNumber between 10101 and 10110;
-- help
-- q1
select employees.firstName from employees inner join offices inner join Customers  where offices.officeCode= employees.officeCode ;
-- q2
select Customers.customerName from Customers inner join orders on Customers.customerNumber=orders.customerNumber and orders.status='shipped';
select Customers.customerName from Customers inner join payments on Customers.customerNumber=payments.customerNumber and payments.paymentDate between'2004-11-03' and '2004-11-14';
-- q4
select Customers.customerName from Customers inner join payments on Customers.customerNumber=payments.customerNumber and payments.amount>=(select avg(payments.amount) from payments);