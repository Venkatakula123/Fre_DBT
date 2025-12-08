{% snapshot snapshot_name %}
    {{
        config(
            alias = 'SalesSCD2',
            target_schema='SCD',
            target_database='MYDB',
            unique_key='SALES_ID',
            strategy='timestamp',
            updated_at = 'Sale_timestamp',
            dbt_valid_to_current = "'2999-12-31T00:00:00'"
        )
    }}

    select * from {{ source('Exp', 'salesdet') }}
 {% endsnapshot %}