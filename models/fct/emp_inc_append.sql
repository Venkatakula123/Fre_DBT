{{
    config(
        materialized='incremental'
    )
}}
Select * from {{source('test','employee')}}
 
 --By default the strategy was append. Here it will perform the Full insert. Not recommended