SELECT 
    a.date_date,
    ROUND(a.operationnal_margin - b.ads_costs,2) AS ads_margin,
    a.average_basket,
    a.operationnal_margin,
    b.ads_costs,
    b.ads_impressions,
    b.ads_clicks,
    a.nb_transactions,
    a.quantity,
    a.revenue,
    a.purchase_cost,
    a.margin,
    a.shipping_fee,
    a.logcost,
FROM {{ ref('finance_days') }} AS a
INNER JOIN {{ ref('int_campaign_day') }} AS b
USING(date_date)
ORDER BY date_date DESC
    
