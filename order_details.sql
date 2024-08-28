-- 1. View the Order_details table.
SELECT count(*)
FROM order_details;
-- 2. What is the range of the table?
SELECT MIN( order_date) as Start , MAX(order_date) as End
FROM order_details;

-- 3. How many orders where made during this range?
SELECT COUNT( DISTINCT (order_id))  As  num_orders
FROM order_details;

-- 4. How many items where ordered within this range?
SELECT COUNT(*) 
FROM order_details;
-- 5. Which orders had the most number of items?

SELECT order_id, COUNT(item_id) AS Num_items
FROM order_details
GROUP BY order_id
ORDER BY Num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT Count(*)
FROM (
SELECT order_id, COUNT(item_id) AS Num_items
FROM order_details
GROUP BY order_id
HAVING Num_items> 12) AS total_items;
