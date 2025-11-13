SELECT 
date_date,
sum(ads_cost) as ads_cost,
sum(impression) as ads_impression,
SUM(click) as ads_clicks
FROM {{ref("int_campaigns")}}
GROUP by date_date
ORDER BY date_date DESC