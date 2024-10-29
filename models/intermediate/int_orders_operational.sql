WITH fusion AS(
    SELECT 
        a.date_date,
        a.orders_id,
        a.revenue,
        a.quantity,
        a.purchase_cost,
        a.margin,
        b.shipping_fee,
        b.logcost,
        b.ship_cost

    FROM {{ ref('int_sales_margin') }} AS a
    INNER JOIN {{ ref('stg_raw__ship') }} AS b
    USING(orders_id))

SELECT 
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_cost,
    margin,
    ROUND(margin + shipping_fee - logcost - ship_cost, 2) AS operationnal_margin
FROM fusion
ORDER BY date_date DESC, orders_id DESC