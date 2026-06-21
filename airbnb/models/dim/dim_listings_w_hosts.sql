WITH 

dimlistings as ( 
    SELECT * FROM {{ref('dim_listings_cleansed')}}
),

dimhosts as (
    SELECT * FROM {{ref('dim_hosts_cleansed', v=2 )}}
)

SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.host_id,
    l.price,
    l.price_str,
    h.host_name,
    h.Is_Superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at

FROM dimlistings l
LEFT JOIN dimhosts h ON l.host_id = h.host_id