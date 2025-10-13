{% macro cal_farenheit(AVG_TEMPRATURE,decimals = 1)%}
ROUND(({{AVG_TEMPRATURE}} - 32)*5/9,{{decimals}})
{% endmacro %}


{% macro generate_profit_model(table_name)%}
Select sales_date, 
SUM(QUANTITY_SOLD * UNIT_SELL_PRICE ) as total_revenue,
SUM(QUANTITY_SOLD * UNIT_PURCHASE_COST ) as total_cost,
SUM(QUANTITY_SOLD * UNIT_SELL_PRICE ) - SUM(QUANTITY_SOLD * UNIT_PURCHASE_COST ) as profit
from {{ source('SLEEK',table_name)}} group by sales_date
{% endmacro %}
