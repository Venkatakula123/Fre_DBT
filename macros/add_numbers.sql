{% macro add_numbers(numbers) %}
    {%- set total = 0 -%}
    {%- for numb in numbers -%}
        {%- set total = total + numb -%}
    {%- endfor -%}
    {{ total }}
{% endmacro %}