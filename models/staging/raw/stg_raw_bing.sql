SELECT
  date_date,
 paid_source,
 campaign_key,
 camPGN_name as campaign_name,
 cast(ads_cost as Float64) AS ads_cost,
 impression,
 click
from {{source("raw","bing")}}