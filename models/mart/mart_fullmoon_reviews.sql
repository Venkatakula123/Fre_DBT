{{
    config(
        materialized='table',
        tag = 'Avr'
    )
}}

with fact_rev as (
    Select * from {{ref('fct_reviews')}}
),

 fullmoon as (
    Select * from {{ref('seed_full_moon_dates')}}
)

Select r.*,
case WHEN fm.full_moon_date is null THEN     'NOT FULL MOON'
     ELSE 'FULL MOON'
END AS is_full_moon from fact_rev r left join fullmoon fm 
                        ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))