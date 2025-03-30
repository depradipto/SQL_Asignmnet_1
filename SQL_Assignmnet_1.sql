/* 1 Create a table called employees with the following structure 
emp_id (integer, should not be NULL and should be a primary key) 
emp_name (text, should not be NULL) 
age (integer, should have a check constraint to ensure the age is at least 18) 
email (text, should be unique for each employee) salary (decimal, with a default value of 30,000).
 Write the SQL query to create the above table with all constraints.*/
-- Step 1: Create the database
create database kompany_det;
use kompany_det;
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY NOT NULL,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    salary DECIMAL DEFAULT 30000
);
select * from employees;
ALTER TABLE employees ADD EMAIL VARCHAR(100);
SELECT * FROM employees;

/* 2 . Explain the purpose of constraints and how they help maintain data integrity in a database. 
Provide examples of common types of constraints.

-> Constraints are rules applied to database columns to ensure the accuracy, validity, and integrity of the data stored. 
They prevent invalid data from being inserted, updated, or deleted, which helps maintain consistency and reliability within the database. 

Prevent incorrect data entry (e.g., negative age, duplicate emails).

Ensure consistency (e.g., a salary must be provided or defaulted).

Enforce relationships (e.g., foreign keys to maintain links between tables).

Improve data quality and reduce the need for complex application logic.

Examples of constraints: not null, primary key,check, default.*/

/*3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

-> The NOT NULL constraint ensures that a column must always have a value—in other words, it cannot be left empty.

Reasons to Use NOT NULL:
Essential data requirement: If a value is critical for the record to make sense (e.g., employee name, email), you don't want it to be empty.

Data consistency: Prevents missing or incomplete records.

Application logic: Enforces that some fields are mandatory, reducing the chance of errors or the need for extra checks in your code.

No, a primary key cannot contain NULL values.

Justification:
A primary key uniquely identifies each row in a table.

NULL means "unknown" or "undefined," and you can't uniquely identify something that is unknown.

Primary keys must always have a known and unique value for every row.*/

/* 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. 
Provide an example for both adding and removing a constraint.

Adding a constraint:
Add a UNIQUE constraint to the email column
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

Add a CHECK constraint to ensure age >= 18.
ALTER TABLE employees
ADD CONSTRAINT check_age CHECK (age >= 18);

You can also add NOT NULL using
ALTER TABLE employees
ALTER COLUMN emp_name SET NOT NULL;

Removing a constraint:
Drop the unique_email constraint.
ALTER TABLE employees
DROP CONSTRAINT unique_email;

Remove a NOT NULL constraint.
ALTER TABLE employees
ALTER COLUMN emp_name DROP NOT NULL;*/

/*5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. 
Provide an example of an error message that might occur when violating a constraint.

-> When you try to insert, update, or delete data in a way that breaks a constraint, the database will block the operation and return an error.
 This protects the integrity of your data.
Example:
email TEXT UNIQUE
INSERT INTO employees (emp_id, emp_name, age, email)
VALUES (2, 'Alice Smith', 30, 'john@example.com');
ERROR: duplicate key value violates unique constraint "employees_email_key"
DETAIL: Key (email) = (john@example.com) already exists.*/

/*6. You created a products table without constraints as follows: 
CREATE TABLE products ( product_id INT, product_name VARCHAR(50), price DECIMAL(10, 2));
Now, you realise that The product_id should be a primary key The price should have a default value of 50.00. 

-> Add primary key constraint to product_id
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

Set default value for price
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;*/

/* 7.Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
SELECT 
    Students.student_name, 
    Classes.class_name
FROM 
    Students
INNER JOIN 
    Classes
ON 
    Students.class_id = Classes.class_id;*/
    
/* 8.Write a query that shows all order_id, customer_name, and product_name, 
ensuring that all products are listed even if they are not associated with an order Hint: (use INNER JOIN and LEFT JOIN)

SELECT 
    Products.order_id,
    Customers.customer_name,
    Products.product_name
FROM 
    Products
LEFT JOIN 
    Orders ON Products.order_id = Orders.order_id
LEFT JOIN 
    Customers ON Orders.customer_id = Customers.customer_id;*/
    
/* 9.Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

SELECT 
    p.product_id,
    p.product_name,
    SUM(s.amount) AS total_sales_amount
FROM 
    Products p
INNER JOIN 
    Sales s ON p.product_id = s.product_id
GROUP BY 
    p.product_id, p.product_name;*/
    
/*10. Write a query to display the order_id, customer_name, 
and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

SELECT 
    o.order_id,
    c.customer_name,
    od.quantity
FROM 
    Orders o
INNER JOIN 
    Customers c ON o.customer_id = c.customer_id
INNER JOIN 
    Order_Details od ON o.order_id = od.order_id
ORDER BY 
    o.order_id; 
*/
    
/* Write the SQl commands of the following:
1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences.
-- Primary Keys
SELECT TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME = 'PRIMARY' AND TABLE_SCHEMA = 'mavenmovies';

-- Foreign Keys
SELECT TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME IS NOT NULL AND TABLE_SCHEMA = 'mavenmovies';

2- List all details of actors 

SELECT * FROM actor;

3 -List all customer information from DB. 

SELECT * FROM customer;

4 -List different countries. 

SELECT DISTINCT country FROM country;

5 -Display all active customers. 

SELECT * FROM customer WHERE active = 1;

6 -List of all rental IDs for customer with ID 1. 

SELECT rental_id FROM rental WHERE customer_id = 1;

7 - Display all the films whose rental duration is greater than 5 . 

SELECT title FROM film WHERE rental_duration > 5;

8 - List the total number of films whose replacement cost is greater than $15 and less than $20. 

SELECT COUNT(*) FROM film 
WHERE replacement_cost > 15 AND replacement_cost < 20;

9 - Display the count of unique first names of actors. 

SELECT COUNT(DISTINCT first_name) FROM actor;

10- Display the first 10 records from the customer table . 

SELECT * FROM customer LIMIT 10;

11 - Display the first 3 records from the customer table whose first name starts with ‘b’. 

SELECT * FROM customer 
WHERE first_name LIKE 'b%' LIMIT 3;

12 -Display the names of the first 5 movies which are rated as ‘G’. 

SELECT title FROM film 
WHERE rating = 'G' LIMIT 5;

13-Find all customers whose first name starts with "a". 

SELECT * FROM customer WHERE first_name LIKE 'a%';

14- Find all customers whose first name ends with "a". 

SELECT * FROM customer WHERE first_name LIKE '%a';

15- Display the list of first 4 cities which start and end with ‘a’ . 

SELECT city FROM city 
WHERE city LIKE 'a%a' LIMIT 4;

16- Find all customers whose first name have "NI" in any position. 

SELECT * FROM customer WHERE first_name LIKE '%ni%';

17- Find all customers whose first name have "r" in the second position . 

SELECT * FROM customer WHERE first_name LIKE '_r%';

18 - Find all customers whose first name starts with "a" and are at least 5 characters in length. 

SELECT * FROM customer 
WHERE first_name LIKE 'a____%';

19- Find all customers whose first name starts with "a" and ends with "o". 

SELECT * FROM customer 
WHERE first_name LIKE 'a%o';

20 - Get the films with pg and pg-13 rating using IN operator. 

SELECT title FROM film 
WHERE rating IN ('PG', 'PG-13');

21 - Get the films with length between 50 to 100 using between operator. 

SELECT title FROM film 
WHERE length BETWEEN 50 AND 100;

22 - Get the top 50 actors using limit operator. 

SELECT * FROM actor LIMIT 50;

23 - Get the distinct film ids from inventory table.
SELECT DISTINCT film_id FROM inventory;
*/

/*
Basic Aggregate Functions: 
Question 1: Retrieve the total number of rentals made in the Sakila database. Hint: Use the COUNT() function. 
SELECT COUNT(*) AS total_rentals 
FROM rental;

Question 2: Find the average rental duration (in days) of movies rented from the Sakila database. Hint: Utilize the AVG() function. 
SELECT AVG(rental_duration) AS avg_rental_duration_days 
FROM film;

String Functions: 
Question 3: Display the first name and last name of customers in uppercase. Hint: Use the UPPER () function. 
SELECT UPPER(first_name) AS first_name_upper, 
       UPPER(last_name) AS last_name_upper 
FROM customer;

Question 4: Extract the month from the rental date and display it alongside the rental ID. Hint: Employ the MONTH() function. 
SELECT rental_id, MONTH(rental_date) AS rental_month 
FROM rental;

GROUP BY: 
Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals). Hint: Use COUNT () in conjunction with GROUP BY. 
SELECT customer_id, COUNT(*) AS rental_count 
FROM rental 
GROUP BY customer_id 
ORDER BY rental_count DESC;

Question 6: Find the total revenue generated by each store. Hint: Combine SUM() and GROUP BY. 
SELECT s.store_id, SUM(p.amount) AS total_revenue 
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

Question 7: Determine the total number of rentals for each category of movies. Hint: JOIN film_category, film, and rental tables, then use COUNT () and GROUP BY. 
SELECT c.name AS category, COUNT(r.rental_id) AS rental_count 
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name 
ORDER BY rental_count DESC;

Question 8: Find the average rental rate of movies in each language. Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT l.name AS language, AVG(f.rental_rate) AS avg_rental_rate 
FROM language l
JOIN film f ON l.language_id = f.language_id
GROUP BY l.name;
*/

/*
Joins 
Questions 9 - Display the title of the movie, customer s first name, and last name who rented it. Hint: Use JOIN between the film, inventory, rental, and customer tables. 
SELECT 
    f.title AS movie_title,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    customer c ON r.customer_id = c.customer_id
ORDER BY 
    f.title, c.last_name;
    
Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind." Hint: Use JOIN between the film actor, film, and actor tables. 
SELECT 
    a.first_name, 
    a.last_name
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id
WHERE 
    f.title = 'Gone with the Wind';
    
Question 11: Retrieve the customer names along with the total amount they've spent on rentals. Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY. 
SELECT 
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    total_spent DESC;

Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London'). Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
SELECT 
    c.first_name,
    c.last_name,
    GROUP_CONCAT(DISTINCT f.title ORDER BY f.title SEPARATOR ', ') AS rented_movies
FROM 
    customer c
JOIN 
    address a ON c.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
WHERE 
    ci.city = 'London'
GROUP BY 
    c.customer_id, c.first_name, c.last_name;
    */
    
/*
Advanced Joins and GROUP BY: 
Question 13: Display the top 5 rented movies along with the number of times they've been rented. Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results. 
SELECT 
    f.title AS movie_title,
    COUNT(r.rental_id) AS rental_count
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.film_id, f.title
ORDER BY 
    rental_count DESC
LIMIT 5;

Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.    
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
WHERE 
    i.store_id IN (1, 2)
GROUP BY 
    c.customer_id, c.first_name, c.last_name
HAVING 
    COUNT(DISTINCT i.store_id) = 2;
*/

/*
Windows Function: 
1. Rank the customers based on the total amount they've spent on rentals. 
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    total_spent DESC;
    
2. Calculate the cumulative revenue generated by each film over time. 
SELECT 
    f.film_id,
    f.title,
    p.payment_date,
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    payment p ON r.rental_id = p.rental_id
ORDER BY 
    f.film_id, p.payment_date;
    
3. Determine the average rental duration for each film, considering films with similar lengths. 
SELECT 
    f.film_id,
    f.title,
    f.length,
    f.rental_duration,
    AVG(f.rental_duration) OVER (PARTITION BY NTILE(5) OVER (ORDER BY f.length)) AS avg_duration_for_similar_length
FROM 
    film f
ORDER BY 
    f.length;
    
4. Identify the top 3 films in each category based on their rental counts. 
WITH film_rentals AS (
    SELECT 
        c.name AS category,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS rank_in_category
    FROM 
        category c
    JOIN 
        film_category fc ON c.category_id = fc.category_id
    JOIN 
        film f ON fc.film_id = f.film_id
    JOIN 
        inventory i ON f.film_id = i.film_id
    JOIN 
        rental r ON i.inventory_id = r.inventory_id
    GROUP BY 
        c.name, f.title
)
SELECT 
    category,
    title,
    rental_count
FROM 
    film_rentals
WHERE 
    rank_in_category <= 3
ORDER BY 
    category, rental_count DESC;
    
5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers. 
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS rental_count,
    COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS difference_from_average
FROM 
    customer c
LEFT JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    difference_from_average DESC;
    
6. Find the monthly revenue trend for the entire rental store over time. 
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_revenue,
    SUM(SUM(p.amount)) OVER (ORDER BY DATE_FORMAT(p.payment_date, '%Y-%m')) AS cumulative_revenue
FROM 
    payment p
GROUP BY 
    DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY 
    month;
    
7. Identify the customers whose total spending on rentals falls within the top 20% of all customers. 
WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent,
        PERCENT_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_percentile
    FROM 
        customer c
    JOIN 
        payment p ON c.customer_id = p.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_spent
FROM 
    customer_spending
WHERE 
    spending_percentile <= 0.2
ORDER BY 
    total_spent DESC;
    
8. Calculate the running total of rentals per category, ordered by rental count. 
WITH category_rentals AS (
    SELECT 
        c.name AS category,
        COUNT(r.rental_id) AS rental_count
    FROM 
        category c
    JOIN 
        film_category fc ON c.category_id = fc.category_id
    JOIN 
        film f ON fc.film_id = f.film_id
    JOIN 
        inventory i ON f.film_id = i.film_id
    JOIN 
        rental r ON i.inventory_id = r.inventory_id
    GROUP BY 
        c.name
)
SELECT 
    category,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM 
    category_rentals
ORDER BY 
    rental_count DESC;
    
9. Find the films that have been rented less than the average rental count for their respective categories. 
WITH film_rentals AS (
    SELECT 
        c.name AS category,
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        AVG(COUNT(r.rental_id)) OVER (PARTITION BY c.name) AS avg_category_rentals
    FROM 
        category c
    JOIN 
        film_category fc ON c.category_id = fc.category_id
    JOIN 
        film f ON fc.film_id = f.film_id
    JOIN 
        inventory i ON f.film_id = i.film_id
    JOIN 
        rental r ON i.inventory_id = r.inventory_id
    GROUP BY 
        c.name, f.film_id, f.title
)
SELECT 
    category,
    film_id,
    title,
    rental_count,
    avg_category_rentals
FROM 
    film_rentals
WHERE 
    rental_count < avg_category_rentals
ORDER BY 
    category, rental_count;
    
10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
        SUM(p.amount) AS revenue,
        DENSE_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS revenue_rank
    FROM 
        payment p
    GROUP BY 
        DATE_FORMAT(p.payment_date, '%Y-%m')
)
SELECT 
    month,
    revenue
FROM 
    monthly_revenue
WHERE 
    revenue_rank <= 5
ORDER BY 
    revenue DESC;
    */
    
/*
Normalisation & CTE 
1. First Normal Form (1NF):
a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF. 
-- Current non-1NF structure
SELECT film_id, title, special_features FROM film WHERE film_id = 1;

-- Solution: Create junction table
CREATE TABLE film_special_features (
    film_id SMALLINT UNSIGNED NOT NULL,
    feature VARCHAR(50) NOT NULL,
    PRIMARY KEY (film_id, feature),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- Populate with normalized data
INSERT INTO film_special_features (film_id, feature)
SELECT film_id, SUBSTRING_INDEX(SUBSTRING_INDEX(special_features, ',', n), ',', -1)
FROM film
JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) numbers
WHERE CHAR_LENGTH(special_features) - CHAR_LENGTH(REPLACE(special_features, ',', '')) >= n - 1;

2. Second Normal Form (2NF): 
a. Choose a table in Sakila and describe how you would determine whether it is in 2NF.If it violates 2NF, explain the steps to normalize it. 
-- Normalized structure would involve:
-- 1. customer (customer_id, first_name, last_name, address_id)
-- 2. address (address_id, address, district, city_id, postal_code, phone)
-- 3. city (city_id, city, country_id)
-- 4. country (country_id, country)

3. Third Normal Form (3NF):               
a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF. 
-- Normalized structure would involve:
-- 1. customer (customer_id, first_name, last_name, address_id)
-- 2. address (address_id, address, district, city_id, postal_code, phone)
-- 3. city (city_id, city, country_id)
-- 4. country (country_id, country)

4. Normalization Process:               
a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF. 
WITH actor_film_counts AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)
SELECT * FROM actor_film_counts ORDER BY film_count DESC;

5. CTE Basics:                
a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables. 
WITH actor_film_counts AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)
SELECT * FROM actor_film_counts ORDER BY film_count DESC;

6. CTE with Joins:                
a. Create a CTE that combines information from the film and language tables to display the film title,language name, and rental rate. 
WITH film_language_info AS (
    SELECT 
        f.title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)
SELECT * FROM film_language_info ORDER BY title;

7.CTE for Aggregation:               
a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables. 
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_payments
    FROM 
        customer c
    JOIN 
        payment p ON c.customer_id = p.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name
)
SELECT * FROM customer_revenue ORDER BY total_payments DESC;

8.CTE with Window Functions:               
a. Utilize a CTE with a window function to rank films based on their rental duration from the film table. 
WITH film_ranking AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM 
        film
)
SELECT * FROM film_ranking ORDER BY duration_rank;

9.CTE and Filtering:               
a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
WITH frequent_renters AS (
    SELECT 
        customer_id,
        COUNT(*) AS rental_count
    FROM 
        rental
    GROUP BY 
        customer_id
    HAVING 
        COUNT(*) > 2
)
SELECT 
    c.*,
    fr.rental_count
FROM 
    frequent_renters fr
JOIN 
    customer c ON fr.customer_id = c.customer_id
ORDER BY 
    fr.rental_count DESC;
    
10.CTE for Date Calculations: 
a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table 
WITH monthly_rentals AS (
    SELECT 
        DATE_FORMAT(rental_date, '%Y-%m') AS month,
        COUNT(*) AS rental_count
    FROM 
        rental
    GROUP BY 
        DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT * FROM monthly_rentals ORDER BY month;

11.CTE and Self-Join: 
a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table. Datset for assignment. 
WITH actor_pairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        f.title AS film_title
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
    JOIN 
        film f ON fa1.film_id = f.film_id
)
SELECT 
    a1.first_name AS actor1_first,
    a1.last_name AS actor1_last,
    a2.first_name AS actor2_first,
    a2.last_name AS actor2_last,
    ap.film_title
FROM 
    actor_pairs ap
JOIN 
    actor a1 ON ap.actor1_id = a1.actor_id
JOIN 
    actor a2 ON ap.actor2_id = a2.actor_id
LIMIT 100;

12. CTE for Recursive Search: 
a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
WITH RECURSIVE staff_hierarchy AS (
    -- Base case: employees who report directly to manager_id 1
    SELECT 
        staff_id,
        first_name,
        last_name,
        reports_to,
        1 AS level
    FROM 
        staff
    WHERE 
        reports_to = 1
    
    UNION ALL
    
    -- Recursive case: employees who report to anyone in the hierarchy
    SELECT 
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to,
        sh.level + 1
    FROM 
        staff s
    JOIN 
        staff_hierarchy sh ON s.reports_to = sh.staff_id
)
SELECT * FROM staff_hierarchy ORDER BY level, last_name;

*/



