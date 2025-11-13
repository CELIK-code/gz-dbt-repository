SELECT
date_trunc(date_date, month) as datemonth,
SUM(operational_margin - ads_cost) AS ads_margin,
ROUND(SUM(revenue) / NULLIF(SUM(total_transactions), 0), 2) AS average_basket,
SUM(operational_margin) as operational_margin,
SUM(ads_cost) as ads_cost,
SUM(ads_impression) as ads_impression,
sum(ads_clicks) as ads_clicks,
SUM(quantity) AS quantity,
SUM(revenue) AS revenue,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin,
SUM(shipping_fee) shipping_fee,
SUM(log_cost) AS log_cost,
SUM(ship_cost) AS ship_cost,
FROM {{ref("int_campaigns_day")}}
FULL OUTER JOIN {{ref("finance_days")}}
USING (date_date)
GROUP BY datemonth
ORDER BY datemonth DESC