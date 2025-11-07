select
        products_id,
        CAST(purchSE_PRICE,FLOAT64) AS purchase_price
from {{source('raw', 'products') }}
