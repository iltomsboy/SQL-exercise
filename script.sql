-- start

-- to check table structures
SELECT *
FROM orders
LIMIT 3;

SELECT *
FROM products
LIMIT 3;

SELECT *
FROM customers
LIMIT 3;

-- 1st question
-- most performing items
SELECT name, item_id, COUNT(item_id) AS tot_item_sales
FROM orders
JOIN products
ON orders.item_id = products.id
WHERE orders.fulfilled = 1
GROUP BY name
ORDER BY COUNT(item_id) DESC;

-- most underperforming items
SELECT name, item_id, COUNT(item_id) AS tot_item_sales
FROM orders
JOIN products
ON orders.item_id = products.id
WHERE orders.fulfilled = 1
GROUP BY name
ORDER BY COUNT(item_id);

-- 2nd question
-- all the orders bought
SELECT date, name, customer
FROM orders
JOIN products
ON orders.item_id = products.id
WHERE orders.fulfilled = 1;

-- 3rd question
-- day with highest sales
SELECT date, COUNT(date) AS tot_orders, SUM(price) AS tot_revenues
FROM orders
JOIN products
ON orders.item_id = products.id
WHERE orders.fulfilled = 1
GROUP BY date
ORDER BY SUM(price) DESC;

-- day with lowest sales
SELECT date, COUNT(date) AS tot_orders, SUM(price) AS tot_revenues
FROM orders
JOIN products
ON orders.item_id = products.id
WHERE orders.fulfilled = 1
GROUP BY date
ORDER BY SUM(price);

-- the end
