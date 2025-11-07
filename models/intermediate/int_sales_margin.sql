select  
    *
    , quantity * purchase_price as purchase_cost
    , revenue - (quantity * purchase_price) as margin
from {{ ref('stg_raw_sales')}}
join {{ ref('stg_raw_product')}}
    using(products_id)