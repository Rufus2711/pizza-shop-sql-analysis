-- Basic Queries

-- Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;



-- Calculate the total revenue generated from pizza sales. 
SELECT 
    ROUND(SUM(p.price * od.quantity), 2) AS total_revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id;
    
    
    
-- Identify the highest-priced pizza.
SELECT 
    pt.name, p.price
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;



-- Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(od.order_details_id) AS total_quantity
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_quantity DESC
LIMIT 1;



-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, COUNT(od.quantity) AS total_quantity
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;