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
    SUM(revenue) AS revenue,
    SUM(quantity) AS quantity,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin,
    ROUND(SUM(margin + shipping_fee - logcost - ship_cost), 2) AS operationnal_margin,
    SUM(shipping_fee) AS shipping_fee,
    SUM(logcost) AS logcost,
    SUM(ship_cost) AS ship_cost
FROM fusion
GROUP BY date_date, orders_id
ORDER BY date_date DESC, orders_id DESC