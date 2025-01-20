{{ config(materialized="table") }}
WITH 
customers AS (
    SELECT
        id, 
        first_name||' '||last_name AS name
    FROM
        `dbt-tutorial.jaffle_shop.customers`
),

orders AS (
    SELECT
        id,
        user_id
    FROM
        `dbt-tutorial.jaffle_shop.orders`
)

SELECT
    customers.id AS customer_id,
    customers.name,
    COUNT(DISTINCT orders.id) AS order_cnt
FROM
    customers
LEFT JOIN
    orders
    ON customers.id = orders.user_id
GROUP BY
    1, 2