/*What is our total revenue*/
select sum(amount) 
from payments 

/*How many customers do we have*/
select count(customerNumber) 
from customers

/*How many orders have we processed?*/ 
select count(orderNumber)
from orders

/*How many payments have we received*/ 
select count(checkNumber) 
from payments

 /*What is the average order value?*/
select avg(quantityOrdered) 
from orderdetails

/*Which cities generate the most sales*/
select count(t1.customerNumber) as number_of_sales, country
from orders t1 
inner join customers t2 
on t1.customerNumber = t2.customerNumber
where status = "shipped" or status = "in process"
group by country
order by country

/*Who are our Top 10 customers by revenue?*/
SELECT customerNumber, SUM(amount) AS total_paid
FROM payments
GROUP BY customerNumber
ORDER BY total_paid DESC
LIMIT 10;


/*Which customers place the most orders?*/
select customerNumber, count(orderNumber) as number_of_orders
from orders
group by customerNumber
order by number_of_orders desc
limit 1

/*Which customers have the highest credit limits*/
select customerNumber, creditLimit
from customers
group by customerNumber
order by creditLimit desc 
limit 1

/*Which countries have the largest customer base*/
select country, count(customerNumber)
from customers
group by country
order by country*/

/*Which offices have the strongest sales teams*/
select sum(amount) as total_revenue, t1.salesRepEmployeeNumber, officeCode
from customers t1
inner join payments t2
on t1.customerNumber = t2.customerNumber
inner join employees t3
on t1.salesRepEmployeeNumber = t3.employeeNumber
group by salesRepEmployeeNumber
order by total_revenue desc
limit 4

/*Which representative receives the highest customer payments*/
select sum(amount) as total_revenue, t1.salesRepEmployeeNumber
from customers t1
inner join payments t2
on t1.customerNumber = t2.customerNumber
group by salesRepEmployeeNumber
order by total_revenue desc

/*Which representative generates the highest sales*/
select count(t2.customerNumber) as sales, salesRepEmployeeNumber
from customers t1
inner join orders t2 
on t1.customerNumber = t2.customerNumber
where status = "shipped" or "in process"
group by salesRepEmployeeNumber
order by salesRepEmployeeNumber

/*Which sales representative manages the most customers*/
select count(customerNumber) as no_of_customers, t2.salesRepEmployeeNumber
from employees t1 
inner join customers t2
on t1.employeeNumber = t2.salesRepEmployeeNumber
group by salesRepEmployeeNumber
order by salesRepEmployeeNumber

/*Average revenue per employee*/
select avg(amount) as avg_revenue, employeenumber
from customers t1
inner join employees t2
on t1.salesRepEmployeeNumber = t2.employeeNumber
inner join payments t3
on t1.customerNumber = t3.customerNumber
group by employeeNumber
order by employeeNumber 

/*Number of employees in each office
select count(employeeNumber) as number_of_employees, officeCode
from employees
group by officeCode
order by officeCode

/*Number of customers served by each office*/
select count(customerNumber), t3.officeCode 
from customers t1
inner join employees t2
on t1.salesRepEmployeeNumber = t2.employeeNumber
inner join offices t3
on t2.officeCode = t3.officeCode
group by officeCode
order by officeCode

/* Revenue by office*/
select sum(amount) as revenue, t4.officeCode
from customers t1
inner join employees t2
on t1.salesRepEmployeeNumber = t2.employeeNumber
inner join payments t3
on t1.customerNumber = t3.customerNumber
inner join offices t4
on t2.officeCode = t4.officeCode
group by officeCode
order by officeCode 

/*Which vendors supply our best-selling products*/
select productCode, productVendor 
from products
where productCode ="S18_3232"

/*Which product lines generate the most revenue*/
select sum(amount) as revenue, t1.productLine
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
inner join customers t4
on t3.customerNumber = t4.customerNumber
inner join payments t5
on t4.customerNumber = t5.customerNumber
group by productLine
order by revenue desc

/*Which products sell the most units*/
select count(t2.orderNumber) as number_of_sales, t1.productCode
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
where status = "shipped" or status = "in process"
group by productCode
order by number_of_sales desc

/*Which products generate the highest revenue*/
select sum(amount) as revenue, t1.productCode
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
inner join customers t4
on t3.customerNumber = t4.customerNumber
inner join payments t5
on t4.customerNumber = t5.customerNumber
group by productCode
order by revenue desc

/*Number of sales representatives*/
select count(employeeNumber) 
from employees
where jobTitle = "sales rep"

