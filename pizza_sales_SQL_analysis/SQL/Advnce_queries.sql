-- Advanced Queries

-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.name,
    CONCAT(ROUND(100 * (SUM(od.quantity * p.price) / (SELECT 
                            SUM(od.quantity * p.price)
                        FROM
                            pizzas p
                                JOIN
                            order_details od ON od.pizza_id = p.pizza_id)),
                    2),
            '%') AS revenue_percentage
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name;



-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

with ranked as 
(select pt.category,pt.name,round(sum(od.quantity*p.price),2) as revenue,
dense_rank() over(partition by pt.category order by sum(od.quantity*p.price) DESC) as rnk from 
pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
group by pt.category,pt.name)

SELECT 
    category, name, revenue
FROM
    ranked
WHERE
    rnk <= 3
ORDER BY category , revenue DESC;