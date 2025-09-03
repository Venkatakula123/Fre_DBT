{{ config(
    materialized = 'table',
    on_schema_change = 'fail',
    unique_key = 'empno'
)}}

Select * from {{source('Exp','em')}}

{% if is_incremental()%}
 where dtime > (select max(dtime) from {{this}})
{% endif %}