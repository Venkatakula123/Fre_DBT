{{config(materialized = 'table')}}

Select e.*,d.DEPARTMENT_ID,d.location from {{source('test','employee')}} e join {{source('test','department')}} d on e.DEPARTMENT = d.DEPARTMENT_name