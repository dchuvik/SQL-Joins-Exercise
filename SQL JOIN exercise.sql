/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */

SELECT   p.name as "Product Name", c.name as "Category Name"
FROM categories as c
INNER JOIN products as p
ON p.CategoryID = c.CategoryID
where c.name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT p.name as "Product Name", p.price as "Product Price", r.rating as "rating"
FROM products as p
INNER JOIN reviews as r
ON p.productID = r.productID
where r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT employees.firstName as "First Name", employees.LastName as "Last Name", SUM(sales.quantity) as Total
FROM sales
INNER JOIN employees
ON employees.employeeID = sales.employeeID
GROUP BY employees.firstName, employees.LastName
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name as "Dept Name", c.name as "Category Name"
FROM departments as d
JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
where c.name = 'Appliances' OR c.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT * FROM products 
WHERE products.name 
LIKE '%Hotel California%';

SELECT p.name, sum(s.Quantity) as 'Total Sold', (p.price * SUM(s.quantity)) as 'Total Price Sold'
FROM products as p
JOIN sales as s
ON p.ProductID = s.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT * FROM products WHERE name like '%VISIO%';

SELECT p.name, r.Reviewer, r.rating, r.comment
FROM products as p
JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID as "Employee ID", e.FirstName AS 'First Name', e.LastName AS 'Last Name', p.productID, p.name, SUM(s.Quantity) AS 'Total Sold'
FROM sales as s
JOIN employees as e ON e.EmployeeID = s.EmployeeID
JOIN products as p On p.productID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;

