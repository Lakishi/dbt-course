WITH fct_reviews as (
    SELECT listing_id,
        review_date
    FROM {{ref('fct_reviews')}}
),

dim_listings AS (
    SELECT listing_id,
        created_at
    FROM {{ref('dim_listings_cleansed')}}
)

SELECT r.listing_id AS Review_listingID,
        l.listing_id AS listing_id,
        r.review_date,
        l.created_at AS listing_created_date
FROM fct_reviews r
INNER JOIN dim_listings l ON
    r.listing_id = l.listing_id
WHERE l.created_at > r.review_date