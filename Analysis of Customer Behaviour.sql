-- 1. Combine the Menu_items table and the order_details table
select * from menu_items;
select* from order_details;


Select*
FROM  order_details AS od
LEFT JOIN Menu_items as mi
On od.item_id = mi.menu_item_id;
-- 2. What were the least and most ordered items? what category where they in?
    -- most ordered iitems
Select item_name, category, COUNT(order_details_id) as num_purchases
FROM  order_details AS od
LEFT JOIN Menu_items as mi
On od.item_id = mi.menu_item_id
GROUP BY item_name, category 
ORDER BY num_purchases DESC;
    -- least ordered items
Select item_name, category, COUNT(order_details_id) as num_purchases
FROM  order_details AS od
LEFT JOIN Menu_items as mi
On od.item_id = mi.menu_item_id
GROUP BY item_name, category 
ORDER BY num_purchases;
-- 3. What were the top 5 orders that spent the most money?
Select  order_id, SUM(price) AS Total_spent
FROM  order_details AS od
LEFT JOIN Menu_items as mi
On od.item_id = mi.menu_item_id
GROUP BY  order_id
ORDER BY Total_spent DESC
LIMIT 5;
-- 4. View the details of the highest spend order. What Insights can you gather from the results?
Select category, COUNT(item_id) AS num_items
FROM  order_details AS od
LEFT JOIN Menu_items as mi
On od.item_id = mi.menu_item_id
WHERE order_id = 440 
GROUP BY category;
-- the category with the highest number of orders was italian so its safe to say that Italian doing well.
-- 5 View details of the top 5 highest spend orders. What insights can you gather.
Select order_id, category, COUNT(item_id) AS num_items
FROM  order_details AS od 
LEFT JOIN Menu_items as mi
On od.item_id = mi.menu_item_id
WHERE order_id iN (440,2075,1975,330,2675)
GROUP BY  order_id, category;
-- according to the results the best selling items on the top five orders are italian, mexican, asian and the american.
-- American and Asian are the least ordered items 

