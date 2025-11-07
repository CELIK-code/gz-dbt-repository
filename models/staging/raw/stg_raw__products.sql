with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
       products_id,
       cast(purchSE_PRICE as FLOAT64) AS purchase_price

    from source

)

select * from renamed