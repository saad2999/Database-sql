show databases;
show tables;
use classicmodels;
select employees.firstName, employees.lastName from employees where employees.officeCode in (select offices.officeCode from offices where offices.country = 'USA');
select * from customers where customers.customerNumber in (select payments.customerNumber from payments where amount > 1000 and amount < 5000);
select * from orders;
select customers.customerName,customers.phone  from customers where customers.customerNumber in(select orders.customerNumber from orders where orders.orderDate like'%2003%');
select customers.customerName,customers.phone  from customers where not exists (select orders.customerNumber from orders );
-- q5
select * from orders,customers as sa;
select products.productCode,products.productName,orderdetails.quantityOrdered from products,orderdetails where  exists (select orderdetails.productCode from orderdetails where orderdetails.quantityOrdered between 30 and 50  );
-- q6
select customers.customerName from customers where customers.customerNumber in(select orders.customerNumber from orders,payments  where orders.customerNumber=payments.customerNumber and orders.status='Cancelled' and payments.amount >50 );
-- q5 sir wala    
-- select customers.customerName from customers where not exists (select * from orders where customers.customerNumber = orders.customerNumber );
select orders.orderNumber from orders where orders.customerNumber in (select payments.customerNumber from orderdetails,payments where orders.orderNumber=orderdetails.orderNumber  and payments.amount > 6000 );
select customers.customerName  from customers where exists (select orders.customerNumber from orders,orderdetails,payments where  orders.orderNumber=orderdetails.orderNumber and customers.customerNumber=payments.customerNumber and customers.customerNumber=orders.customerNumber and orderdetails.quantityOrdered>1 and payments.amount>6000)

