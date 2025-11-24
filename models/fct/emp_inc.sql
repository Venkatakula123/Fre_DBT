{{ config(materialized = 'incremental',unique_key='employee_id', incremental_strategy = 'merge')   }}

with emp_inc as (
    Select * from {{source('test','employee')}}
)

Select * from emp_inc 
{% if is_incremental() %}
    where updated_at > (Select max(updated_at) from {{this}})
{% endif%}