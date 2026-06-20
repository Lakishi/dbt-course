WITH raw_hosts AS (
    SELECT * FROM {{ source('airbnb', 'hosts') }}
)
SELECT 
    ID AS host_id,
    Name as host_name,
    Is_Superhost,
    Created_at,
    Updated_at
    
FROM raw_hosts