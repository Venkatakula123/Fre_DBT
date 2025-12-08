{% snapshot SalesSCDT2_2 %}
    {{
        config(
            alias = 'SalesSCD2_2',
            target_schema='SCD',
            target_database='MYDB',
            unique_key='SALES_ID',
            strategy='timestamp',
            updated_at = 'sale_timestamp',
            hard_deletes = 'new_record',
            
            dbt_valid_to_current = "'2999-12-31T00:00:00'"
        )
    }}

    select * from {{ source('Exp', 'salesdet') }}
 {% endsnapshot %}