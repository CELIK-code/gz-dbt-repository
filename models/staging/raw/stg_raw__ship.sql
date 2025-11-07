    select
        orders_id,
        shipping_fee,
        logcost,
        ship_cost

    from {{ source('raw', 'ship') }}
