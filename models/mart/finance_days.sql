SELECT 
    date_date,
    COUNT(orders_id) AS nb_transactions,
    SUM(revenue) AS revenue,
    SUM(quantity) AS quantity,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin,
    SUM(operationnal_margin) AS operationnal_margin
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date