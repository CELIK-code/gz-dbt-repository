    select
        orders_id,
        shipping_fee,
        logCost,
        ship_cost

    from {{ source('raw', 'ship')}}
