with dim_hosts_cleansed as (
    Select * from {{ ref('src_hosts')}}
)

Select host_id,NVL(Host_name,'Annonymous') as host_name,
    NVL(is_superhost,'f') as is_superhost ,
     created_at,
      updated_at
from dim_hosts_cleansed