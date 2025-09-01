{{
    config(
        materialized='table',transient = false
    )
}}

Select empno,ename,job,sal,deptno, dtime from {{source("Exp","em")}}