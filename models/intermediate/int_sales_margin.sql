WITH fusion AS (
    SELECT 
        a.date_date,
        a.orders_id,
        a.products_id,
        a.revenue,
        a.quantity,
        b.purchase_price
    FROM {{ ref('stg_raw__sales') }} AS a
    INNER JOIN {{ ref('stg_raw__product') }} AS b
    ON a.products_id = b.products_id
)
,
clean AS (
    SELECT
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity,
        purchase_price,
        ROUND(quantity * purchase_price,2) AS purchase_cost
    FROM fusion
) 
SELECT 
    date_date,
    orders_id,
    ROUND(SUM(revenue),2) AS revenue,
    SUM(quantity) AS quantity,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(revenue - purchase_cost), 2) AS margin,
FROM clean
GROUP BY date_date, orders_id
ORDER BY date_date DESC, orders_id DESC