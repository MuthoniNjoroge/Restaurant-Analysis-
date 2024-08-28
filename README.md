# Restaurant Data Analysis Using SQL
 
## Introduction
Understanding customer behavior is crucial for any food service organization in the dynamic restaurant industry. Imagine being able to pinpoint which dishes on your menu captivate your customers the most or identifying the orders that bring in the highest revenue. This SQL project dives deep into restaurant data to conduct an intricate analysis of customer behavior, offering valuable insights that can drive strategic decision-making.

This project aims to answer critical questions by exploring and analyzing data from the **Orders Details** and **Menu Items** tables. The analysis focuses on identifying the most and least ordered items, understanding the spending patterns of customers, and providing a comprehensive view of customer preferences and trends in a restaurant setting.

## Project Steps

##  Step 1: Exploring the menu_items Table

- Identified the Total Number of Items on the Menu:<br/>
  SELECT COUNT(*)<br/>
  FROM menu_items;<br/>
  
- Determinined  the Most and Least Expensive Items:<br/>
  - Most Expensive Item:<br/>
    SELECT * <br/>
    FROM menu_items<br/>
    ORDER BY price DESC<br/>
    LIMIT 1;<br/>
  
  - Least Expensive Item:<br/>
    SELECT *<br/> 
    FROM menu_items<br/>
    ORDER BY price ASC<br/>
    LIMIT 1;<br/>
    
- Counting the Number of Dishes in Each Category:<br/>
  SELECT category, COUNT(*) AS Num_dishes<br/>
  FROM menu_items<br/>
  GROUP BY category;<br/>
  
Calculating the Average Dish Price Within Each Category:<br/>
  SELECT category, AVG(price) AS average_price<br/>
  FROM menu_items<br/>
  GROUP BY category;<br/>

 ## Step 2: Exploring the Orders Details Table<br/>

- Viewing the Order Details Table:<br/>
  SELECT COUNT(*)<br/>
  FROM order_details;<br/>
  
Finding the Range of the Table:<br/>
  SELECT MIN(order_date) AS Start, MAX(order_date) AS End<br/>
  FROM order_details;<br/>
  
Calculating the Number of Orders Made During This Range:<br/>
  SELECT COUNT(DISTINCT order_id) AS num_orders<br/>
  FROM order_details;<br/>
  
Counting the Total Number of Items Ordered:<br/>
  SELECT COUNT(*)<br/>
  FROM order_details;<br/>
  
Identifying the Orders with the Most Number of Items:<br/>
  SELECT order_id, COUNT(item_id) AS Num_items<br/>
  FROM order_details<br/>
  GROUP BY order_id<br/>
  ORDER BY Num_items DESC;<br/>
  
-Counting Orders with More Than 12 Items:<br/>
  SELECT COUNT(*)<br/>
  FROM (
    SELECT order_id, COUNT(item_id) AS Num_items<br/>
    FROM order_details<br/>
    GROUP BY order_id<br/>
    HAVING Num_items > 12<br/>
  ) AS total_items;<br/>

## Step 3: Analyzing Customer Behavior by Combining Tables<br/>

- Combining the Menu Items and Orders Details Tables:<br/>
  SELECT *<br/>
  FROM order_details AS od<br/>
  LEFT JOIN menu_items AS mi <br/>
  ON od.item_id = mi.menu_item_id;<br/>
  
- Identifying the Least and Most Ordered Items and Their Categories:<br/>
  - Most Ordered Items:<br/>
    SELECT item_name, category, COUNT(order_details_id) AS num_purchases<br/>
    FROM order_details AS od <br/>
    LEFT JOIN menu_items AS mi <br/>
    ON od.item_id = mi.menu_item_id<br/>
    GROUP BY item_name, category<br/>
    ORDER BY num_purchases DESC;<br/>
    
  - Least Ordered Items:<br/>
    SELECT item_name, category, COUNT(order_details_id) AS num_purchases<br/>
    FROM order_details AS od <br/>
    LEFT JOIN menu_items AS mi <br/>
    ON od.item_id = mi.menu_item_id <br/>
    GROUP BY item_name, category <br/>
    ORDER BY num_purchases; <br/>
    
Identifying the Top 5 Orders that Spent the Most Money:<br/>
  SELECT order_id, SUM(price) AS Total_spent<br/>
  FROM order_details AS od <br/>
  LEFT JOIN menu_items AS mi <br/>
  ON od.item_id = mi.menu_item_id <br/>
  GROUP BY order_id<br/>
  ORDER BY Total_spent DESC<br/>
  LIMIT 5;<br/>
  
Analyzing the Details of the Highest Spending Order:<br/>
  SELECT category, COUNT(item_id) AS num_items<br/>
  FROM order_details AS od<br/>
  LEFT JOIN menu_items AS mi<br/>
  ON od.item_id = mi.menu_item_id<br/>
  WHERE order_id = 440<br/>
  GROUP BY category;<br/>
  Insight: The category with the highest number of orders was Italian, indicating its popularity.<br/>

Reviewing the Details of the Top 5 Highest Spending Orders:<br/>
  SELECT order_id, category, COUNT(item_id) AS num_items<br/>
  FROM order_details AS od<br/>
  LEFT JOIN menu_items AS mi<br/>
  ON od.item_id = mi.menu_item_id<br/>
  WHERE order_id IN (440, 2075, 1975, 330, 2675)<br/>
  GROUP BY order_id, category;<br/>
  Insight: The best-selling items among the top five orders were from Italian, Mexican, Asian, and American categories. American and Asian were the least ordered categories.<br/>
