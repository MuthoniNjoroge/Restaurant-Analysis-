-- 1 view the menu_items table.
SELECT * 
FROM menu_items;

-- 2 find the number of items on the menu
SELECT COUNT(*)
FROM menu_items;

-- 3 What are the least and most expensive items on the menu?
-- 3.1  most exppensive item is shrimp scampi
SELECT * 
FROM menu_items
ORDER BY price DESC;

-- 3.2  least  exppensive item isEdamame
SELECT * 
FROM menu_items
ORDER BY price ASC;
-- 4 How many Italian dishes are on the menu
SELECT  COUNT(*) 
FROM menu_items
WHERE category = "Italian";
-- 5 What are the least and most expensive italian dishes on the menu?
    -- 5.0 most  exppensive italian  dish 
SELECT *
FROM menu_items
WHERE category= 'Italian'
ORDER BY price DESC;

      -- 5.1  least  exppensive italian dish 
SELECT *
FROM menu_items
WHERE category= 'Italian'
ORDER BY price ASC;

-- 6 How many dishes are each category
Select count(*) as Num_dishes, category
from menu_items
group by category;
-- 7 What is the average dish Price within Each Category?

SELECT category, AVG(Price) AS average_price
FROM menu_items
GROUP BY category;