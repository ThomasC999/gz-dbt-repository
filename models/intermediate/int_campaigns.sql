WITH union_all AS ( 
    SELECT 
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__adwords') }}
    UNION ALL
    SELECT 
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__bing') }}
    UNION ALL
    SELECT 
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__criteo') }}
    UNION ALL
    SELECT 
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__facebook') }}
    )

SELECT
    date_date,
    ROUND(SUM(ads_cost),2) AS ads_costs,
    ROUND(SUM(impression),2) AS ads_impressions,
    ROUND(SUM(click),2) AS ads_clicks
FROM union_all
GROUP BY date_date
ORDER BY date_date DESC
