-- Intermediate Queries

-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category, SUM(od.quantity) AS quantity
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY quantity DESC;



-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hr, COUNT(order_id) AS quantity
FROM
    orders
GROUP BY hr
ORDER BY quantity DESC;



-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    pt.category, COUNT(DISTINCT (p.pizza_type_id)) AS 'count'
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY 'count';
    
    
    
-- Group the orders by date and calculate the average number of pizzas ordered per day.
with order_quantity as
(SELECT 
    o.order_date, SUM(od.quantity) AS total_quantity
FROM
    orders o
        JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY o.order_date)

SELECT 
    ROUND(AVG(total_quantity), 0) as Average_pizza_per_day
FROM
    order_quantity;



-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name, SUM(od.quantity * p.price) AS revenue
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;