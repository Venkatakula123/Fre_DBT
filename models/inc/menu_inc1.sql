-- models/incremental_merge_model.sql

{{ config(
    materialized='incremental', 
    unique_key='surrogate_key',
    on_schema_change = 'fail'
) }}

SELECT
    surrogate_key,
    category,
    item_name,
    amount,
    quantity,
    payment_method,
    sales_timestamp,
    CASE    when payment_method = 'Credit Card' then 1
            when payment_method = 'Debit Card' then 2
            when payment_method = 'Cash' then 3
            else 0 end as p_indicator,
    sales_date
FROM {{ source('Exp', 'salesdet') }}

{% if is_incremental() %}
    WHERE sales_timestamp >= (SELECT COALESCE(MAX(sales_timestamp), '1900-01-01') FROM {{ this }})
{% endif %}