{{config(meterialized=table)}}

WITH orders_per_day as (
 SELECT
 date_date,
 COUNT(DISTINCT orders_id) AS total_transactions,
 ROUND(sum(revenue),2) as revenue,
 ROUND(sum(margin),2) as margin,
 ROUND(sum(operational_margin),2) as operational_margin,
 ROUND(sum(purchase_cost),2) as purchase_cost,
 ROUND(sum(shipping_fee),2) as shipping_fee,
 ROUND(sum(logCost),2) as log_cost,
 ROUND(sum(ship_cost),2) as ship_cost,
 sum(quantity) as quantity
FROM {{ref('int_orders_operational')}}
group by date_date
) 
SELECT
date_date 
, revenue
, margin
, operational_margin
, purchase_cost
, shipping_fee
, log_cost
, ship_cost
, quantity
, ROUND(revenue/NULLIF(total_transactions, 0), 2) AS average_basket
FROM orders_per_day
ORDER BY date_date DESC
