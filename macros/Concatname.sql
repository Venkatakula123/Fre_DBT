{% macro concatname(f, l) %}
    initcap({{ f }} || ' . ' || {{ l }})
{% endmacro %}
