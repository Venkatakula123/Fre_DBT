{{ config(materialized="table") }}

with src_hosts as (select * from {{ source("test", "raw_hosts") }})

select id as host_id, name as host_name, is_superhost, created_at, updated_at
from src_hosts