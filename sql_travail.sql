USE store;
-- from the total items table , get the items (for order6 and total price>30) 
SELECT *, (quantity * unit_price) AS total_price  FROM order_items
where order_id = 6 AND quantity * unit_price > 30;
-- Quantity in stock equal to , 48,38,72
SELECT * FROM products 
WHERE quantity_in_stock in (49,38,72);
-- customers born between 1/1/1990 ANA 1/1/2000
SELECT * FROM customers 
WHERE birth_date between '1990-01-01' AND '2000-01-01';

-- get the customers whose(-adresse contain trail or Avenue ) 
--  phone numbers end with 9

SELECT * FROM customers
where address like  '%TRAIL%' OR 
      address like '%AVENUE%';


SELECT * FROM customers
where phone LIKE '%9';

-- get customers whose:
--   first names are ELKA or AMBUR
-- last names end with EY or ON
-- last names start with MY or contains SE
-- last names contains B followed by R or U

SELECT * FROM customers 
WHERE first_name regexp 'ELKA|AMBUR';

SELECT * FROM customers 
WHERE last_name regexp 'EY$|ON$';

SELECT * FROM customers 
WHERE last_name regexp '^MY|SE';

SELECT * FROM customers 
WHERE last_name regexp 'B[RU]';

-- get the orders that are not shipped
SELECT * FROM orders
WHERE shipped_date IS NULL;

SELECT * , (quantity * unit_price) AS total_price FROM order_items
WHERE order_id=2 order by quantity * unit_price DESC;

-- get the top three loyal customers 

SELECT * from customers
order by points desc limit 3;

-- orders_item and product (order id , 

SELECT order_id,oi.product_id, p.name,oi.quantity,oi.unit_price
 From order_items oi
Inner join products p
on oi.product_id=p.product_id
