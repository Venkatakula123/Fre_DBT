{% snapshot SalesSCDT2_1 %}
    {{
        config(
            alias = 'SalesSCD2_1',
            target_schema='SCD',
            target_database='MYDB',
            unique_key='SALES_ID',
            strategy='check',
            check_cols = ['sale_amount','sale_status','amount','customer_id','product_id'] ,
            
            dbt_valid_to_current = "'2999-12-31T00:00:00'"
        )
    }}

    select * from {{ source('Exp', 'salesdet') }}
 {% endsnapshot %}