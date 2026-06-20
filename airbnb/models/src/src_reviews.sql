WITH raw_reviews AS (
    SELECT * FROM {{ source('airbnb', 'reviews') }}
)
SELECT 
    Listing_ID,
    Date AS review_date,
    Reviewer_Name,
    Comments as review_text,
    Sentiment as review_sentiment
    
FROM raw_reviews