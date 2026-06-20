SELECT *
FROM {{ref('dim_listings_cleansed')}}
WHERE minimum_nights < 1
LIMIT 10 --optional, but useful in case there's millions of records in the table that make this fail