

with dim_listings_cleansed as (
    Select * from {{ ref('src_listings')}}
)
Select 
listing_id,
listing_name,
room_type,
CASE 
    when minimum_nights = 0 then 1
    else minimum_nights
End as minimum_nights, host_id,
replace(price_str,'$') :: number(10,2) as price,
created_at,
updated_at
 from dim_listings_cleansed