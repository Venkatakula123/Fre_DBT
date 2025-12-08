{{
    config(
        materialized = 'incremental', 
        incremental_strategy = 'merge',
        unique_key = 'employee_id',
        merge_update_columns = ['DEPARTMENT','JOB_TITLE','SALARY','MANAGER_ID','EMAIL','PHONE_NUMBER','status','updated_at']
    )
}}
Select * from {{source('test','employee')}}
 {% if is_incremental()%}
    where updated_at > (select max(updated_at) from {{ this }}) 
 {% endif %}
