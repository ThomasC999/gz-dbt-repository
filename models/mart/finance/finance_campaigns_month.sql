SELECT 
    DATE(EXTRACT(YEAR FROM date_date), EXTRACT(MONTH FROM date_date), 01) AS date_month,
    ROUND(SUM(ads_margin),2) AS ads_margin,
    ROUND(AVG(average_basket),2) AS average_basket,
    ROUND(SUM(operationnal_margin),2) AS operationnal_margin,
    ROUND(SUM(ads_costs),2) AS ads_costs,
    ROUND(SUM(ads_impressions),2) AS ads_impressions,
    ROUND(SUM(ads_clicks),2) AS ads_clicks,
    ROUND(SUM(nb_transactions),2) AS nb_transactions,
    ROUND(SUM(quantity),2) AS quantity,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(margin),2) AS margin,
    ROUND(SUM(shipping_fee),2) AS shipping_fee,
    ROUND(SUM(logcost),2) AS logcost,
FROM {{ ref('finance_campaigns_day') }}
GROUP BY date_month
    
