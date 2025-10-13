{% macro auditlog(run_activity)%}
{% set database = 'AIRBNB'%}
{% set schema = 'raw' %}
{% set table_name = 'auditlog' %}
    {% set query%}
   {# {% if this.name %} #}
    insert into  {{database}}.{{schema}}.{{table_name}}  values ('{{invocation_id}}','{{this.name}}','{{run_activity}}',current_timestamp());

   {# {% else %}
    insert into  {{database}}.{{schema}}.{{table_name}}  values ('{{invocation_id}}','{{this.name}}','NA',current_timestamp());
    {% endif %}#}
    {% endset %}
    {% do run_query(query)%}
{% endmacro %}


{% macro audit_prep()%}
{% set database = 'AIRBNB'%}
{% set schema = 'raw' %}
{% set table_name = 'auditlog' %}

 Create table  if not exists {{database}}.{{schema}}.{{table_name}} (
    invocation_id varchar(50),
    model_name varchar(50),
    status varchar(40),
    m_timestamp timestamp

 );

{% endmacro %}