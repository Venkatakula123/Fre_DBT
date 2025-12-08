{{ config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'employee_id'
) }}

select
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    e.salary,
    e.hire_date,
    e.manager_id,
    e.email,
    e.phone_number,
    e.status,
    e.updated_at,
    d.department_id,
    d.department_name,
    d.location
from {{ source('test','employee') }} e
left join {{ source('test','department') }} d
    on e.department = d.department_name

{% if is_incremental() %}
    -- Only process rows that have changed since last run
    where e.updated_at >= (select max(updated_at) from {{ this }})
{% endif %}