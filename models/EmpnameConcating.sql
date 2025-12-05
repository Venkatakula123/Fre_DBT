{{config( materialized = 'table',transient = false )}}

--Select {{concatname("'Bvr'","'AVR'")}} as Name 

Select {{concatname("FIRST_NAME","LAST_NAME")}} as Name from {{source('test','employee')}} 

