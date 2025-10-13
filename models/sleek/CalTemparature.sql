{{
    config(
        materialized='table',
        tag = 'Avr'
    )
}}

Select city_code,city,month,AVG_TEMPRATURE, 
        {{cal_farenheit(AVG_TEMPRATURE,1)}} as MinTemp from City_Temperatures