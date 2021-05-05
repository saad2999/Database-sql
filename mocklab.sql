-- q1
select distinct employees.firstName from employees inner join offices inner join Customers  where offices.officeCode= employees.officeCode and employees.employeeNumber = customers.salesRepEmployeeNumber and offices.city = customers.city; ;
-- q2
select count( distinct Customers.customerName) from Customers inner join orders on Customers.customerNumber=orders.customerNumber and orders.status='shipped';
-- q3
select Customers.customerName from Customers inner join payments on Customers.customerNumber=payments.customerNumber and payments.paymentDate between'2004-11-03' and '2004-11-14';
-- q4
select Customers.customerName from Customers inner join payments on Customers.customerNumber=payments.customerNumber and payments.amount>=(select avg(payments.amount) from payments);
-- q5
select Customers.customerName from Customers where Customers.customerNumber not in(select orders.customerNumber from orders );
-- q6
select products.productName, orderdetails.quantityOrdered from  products inner join orderdetails  where products.productCode=orderdetails.productCode and products.productCode in (select orderdetails.productCode from orderdetails where products.productCode=orderdetails.productCode); 