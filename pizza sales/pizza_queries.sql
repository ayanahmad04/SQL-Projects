use pizza;
-- Q1) Retrieve the total number of orders placed-- 
select Count(order_id) as Total_orders from orders;
-- Q2) Calculate the total revenue generated from pizza sales.
select round(sum(order_details.quantity * pizzas.price ),2) as revenue from pizzas join order_details on pizzas.pizza_id = order_details.pizza_id;
-- Q3) Identify the highest-priced pizza.-- 
-- Approach 1:
SELECT pizza_id, price FROM pizzas 
WHERE price = (SELECT MAX(price) FROM pizzas);
-- Approach 2:
select pizza_types.name,pizzas.price from pizzas join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id order by pizzas.price desc limit 1 ;
-- q4) Identify the most common pizza size ordered.
select pizzas.size,COUNT(order_details.order_details_id) AS size_count  from pizzas join order_details on pizzas.pizza_id = order_details.pizza_id group by pizzas.size order by size_count desc ;
-- q5) List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,sum(order_details.quantity) AS quantity from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id join order_details on order_details.pizza_id = pizzas.pizza_id group by pizza_types.name order by quantity desc limit 5;
-- q6) Determine the top 3 most ordered pizza types based on revenue.
select  pizza_types.name,round(sum(order_details.quantity * pizzas.price )) as Revenue from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id join order_details on order_details.pizza_id = pizzas.pizza_id group by pizza_types.name order by Revenue desc limit 3;
-- q7) Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category,sum(order_details.quantity) AS quantity from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id join order_details on order_details.pizza_id = pizzas.pizza_id group by pizza_types.category order by quantity desc ;
-- q8) Determine the distribution of orders by hour of the day.
select hour(time),sum(order_details.quantity) as quantity from orders join order_details on order_details.order_id=orders.order_id group by hour(time) order by quantity desc;
-- q9) Group the orders by date and calculate the average number of pizzas ordered per day.
select date,sum(order_details.quantity) as quantity,avg() from orders join order_details on order_details.order_id=orders.order_id group by date order by quantity desc; 
