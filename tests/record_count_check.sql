{% set ex_count = {
    'customers' : 5000,
    'employees' : 20
}  %}

{% for table,count in ex_count.items() %}
Select {{ table }} as table_name,
                    (Select count(*) from {{source("test",table)}}) as rec_count,
                    {{count}} as expected_count 
                    where (Select count(*) from {{source('test',table)}}) < {{count}}
{% endfor %}