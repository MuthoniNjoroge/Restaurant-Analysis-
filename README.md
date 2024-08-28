# Restaurant-Analysis-

## Introduction
Understanding customer behavior is crucial for any food service organization in the dynamic restaurant industry. Imagine being able to pinpoint which dishes on your menu captivate your customers the most or identifying the orders that bring in the highest revenue. This SQL project dives deep into restaurant data to conduct an intricate analysis of customer behavior, offering valuable insights that can drive strategic decision-making.

This project aims to answer critical questions by exploring and analyzing data from the **Orders Details** and **Menu Items** tables. The analysis focuses on identifying the most and least ordered items, understanding the spending patterns of customers, and providing a comprehensive view of customer preferences and trends in a restaurant setting.

## Step 1: Exploring the Menu Items Table

- Identified the Total Number of Items on the Menu:<br/>
  SELECT COUNT(*)<br/>
  FROM menu_items;<br/>
  
- Determinined  the Most and Least Expensive Items:<br/>
  - Most Expensive Item:
    SELECT * 
    FROM menu_items
    ORDER BY price DESC
    LIMIT 1;
  
  - Least Expensive Item:<br/>
    SELECT * 
    FROM menu_items
    ORDER BY price ASC
    LIMIT 1;
    
- Counting the Number of Dishes in Each Category:<br/>
  SELECT category, COUNT(*) AS Num_dishes
  FROM menu_items
  GROUP BY category;
Calculating the Average Dish Price Within Each Category:<br/>
  SELECT category, AVG(price) AS average_price
  FROM menu_items
  GROUP BY category;

 ## Step 2: Exploring the Orders Details Table<br/>

- Viewing the Order Details Table:<br/>
  SELECT COUNT(*)
  FROM order_details;
Finding the Range of the Table:
  SELECT MIN(order_date) AS Start, MAX(order_date) AS End<br/>
  FROM order_details;
Calculating the Number of Orders Made During This Range:<br/>
  SELECT COUNT(DISTINCT order_id) AS num_orders
  FROM order_details;
  
Counting the Total Number of Items Ordered:<br/>
  SELECT COUNT(*)
  FROM order_details;
Identifying the Orders with the Most Number of Items:<br/>
  SELECT order_id, COUNT(item_id) AS Num_items
  FROM order_details
  GROUP BY order_id
  ORDER BY Num_items DESC;
-Counting Orders with More Than 12 Items:<br/>
  SELECT COUNT(*)
  FROM (
    SELECT order_id, COUNT(item_id) AS Num_items<br/>
    FROM order_details
    GROUP BY order_id
    HAVING Num_items > 12
  ) AS total_items;

## Step 3: Analyzing Customer Behavior by Combining Tables<br/>

- Combining the Menu Items and Orders Details Tables:<br/>
  SELECT *
  FROM order_details AS od
  LEFT JOIN menu_items AS mi
  ON od.item_id = mi.menu_item_id;
  
- Identifying the Least and Most Ordered Items and Their Categories:<br/>
  - Most Ordered Items:<br/>
    SELECT item_name, category, COUNT(order_details_id) AS num_purchases
    FROM order_details AS od
    LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
    GROUP BY item_name, category
    ORDER BY num_purchases DESC;
  - Least Ordered Items:<br/>
    SELECT item_name, category, COUNT(order_details_id) AS num_purchases
    FROM order_details AS od
    LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
    GROUP BY item_name, category
    ORDER BY num_purchases;
Identifying the Top 5 Orders that Spent the Most Money:<br/>
  SELECT order_id, SUM(price) AS Total_spent
  FROM order_details AS od
  LEFT JOIN menu_items AS mi
  ON od.item_id = mi.menu_item_id
  GROUP BY order_id
  ORDER BY Total_spent DESC
  LIMIT 5;
Analyzing the Details of the Highest Spending Order:<br/>
  SELECT category, COUNT(item_id) AS num_items
  FROM order_details AS od
  LEFT JOIN menu_items AS mi
  ON od.item_id = mi.menu_item_id
  WHERE order_id = 440
  GROUP BY category;
  Insight: The category with the highest number of orders was Italian, indicating its popularity.<br/>

Reviewing the Details of the Top 5 Highest Spending Orders:<br/>
  SELECT order_id, category, COUNT(item_id) AS num_items
  FROM order_details AS od
  LEFT JOIN menu_items AS mi
  ON od.item_id = mi.menu_item_id
  WHERE order_id IN (440, 2075, 1975, 330, 2675)
  GROUP BY order_id, category;
  Insight: The best-selling items among the top five orders were from Italian, Mexican, Asian, and American categories. American and Asian were the least ordered categories.
