{{
    config(
        materialized = 'view'
    )
}}

WITH src_hosts as (

    SELECT * FROM {{ref('src_hosts')}}

)
SELECT
    host_id,
    COALESCE(host_name, 'N/A') AS host_name,
    Is_Superhost,
    created_at,
    updated_at,
FROM 
    src_hosts
