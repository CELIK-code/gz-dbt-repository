with 

source as (

    select * from {{ source('raw', 'products') }}

),

renamed as (

    select
        products_id,
        CAST(purchSE_PRICE,FLOAT64) AS purchase_price


    from source

)

select * from renamed