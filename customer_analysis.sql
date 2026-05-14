



--Q5: Which cities have the highest number of customers?
SELECT TOP 10
    customer_city,
    COUNT(customer_unique_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY total_customers DESC;


-- Q6: Which states have the highest number of orders?
SELECT
    customer_state,
    COUNT(order_id) AS total_orders
FROM olist_customers_dataset cu
JOIN olist_orders_dataset od
ON cu.customer_id = od.customer_id
GROUP BY customer_state
ORDER BY total_orders DESC;

--Q7: What is the average review score for products?
SELECT AVG(price) AS avg_price
FROM olist_order_items_dataset;


--Q9: Which products have been sold the most?
SELECT TOP 10
    product_id,
    COUNT(*) AS total_sales
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY total_sales DESC;


--Q10: Which sellers have generated the most revenue?
select TOP 10
seller_id, round(sum(price), 2) as total_revenue
from olist_order_items_dataset oi
group by seller_id
order by total_revenue desc;

--Q11: What is orders and customers information?
SELECT 
    o.order_id,
    c.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id;



--Q12: What is the product category, seller and price information?
select product_category_name,seller_id,price
from olist_order_items_dataset oi
join olist_products_dataset pd
on oi.product_id = pd.product_id;



-- Q13: Which customers have made more than one order?
 SELECT customer_id, COUNT(order_id) AS total_orders
 FROM olist_orders_dataset
 group by customer_id
 having COUNT(order_id) > 1
 order by total_orders desc;
