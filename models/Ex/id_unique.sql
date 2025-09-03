{{ dbt_utils.deduplicate(
    relation=source('test', 'ab'),
    partition_by='id',
    order_by="ID desc",
   )
}}