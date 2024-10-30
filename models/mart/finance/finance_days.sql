WITH clean AS(
    SELECT 
        date_date,
        COUNT(orders_id) AS nb_transactions,
        ROUND(SUM(revenue),2) AS revenue,
        SUM(quantity) AS quantity,
        ROUND(SUM(purchase_cost),2) AS purchase_cost,
        ROUND(SUM(margin),2) AS margin,
        ROUND(SUM(operationnal_margin),2) AS operationnal_margin,
        ROUND(SUM(shipping_fee),2) AS shipping_fee,
        ROUND(SUM(logcost),2) AS logcost,
        ROUND(SUM(ship_cost),2) AS ship_cost
    FROM {{ ref('int_orders_operational') }}
    GROUP BY date_date)
SELECT 
    date_date,
    nb_transactions,
    ROUND(SAFE_DIVIDE(revenue, nb_transactions),2) AS average_basket,
    quantity,
    revenue,
    purchase_cost,
    margin,
    operationnal_margin,
    shipping_fee,
    logcost,
FROM clean
ORDER BY date_date DESC