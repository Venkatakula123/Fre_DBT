{{ config(materialized="view", query_tag="dep", tags="daily") }}


select 'Avr' name, 2 id, 55 markskk