SELECT
date_date,
round(operational_margin - ads_cost,2) as ads_margin ,
average_basket,
operational_margin,
ads_cost,
ads_impression,
ads_clicks,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
log_cost,
ship_cost
FROM {{ref("int_campaigns_day")}}
FULL OUTER JOIN {{ref("finance_days")}}
USING (date_date)
ORDER BY date_date DESC 