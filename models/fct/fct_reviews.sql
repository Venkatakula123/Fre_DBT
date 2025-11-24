{{
 config(
 materialized = 'incremental',
 on_schema_change='fail'
 )
 }}

 with src_review as (
    Select * from {{ref('src_reviews')}}
 )
 Select * from src_review where review_text is not null
 {% if is_incremental() %}
 AND review_date > (Select max(review_date) from {{this}})
 {% endif %}