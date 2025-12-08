{% snapshot SalesSCDT2_4 %}
    {{
        config(
            alias = 'SalesSCD2_4',
            target_schema='SCD',
            target_database='MYDB',
            unique_key='SALES_ID',
            strategy='timestamp',
            updated_at = 'sale_timestamp',
            dbt_valid_to_current = "'2999-12-31T00:00:00'",
            snapshot_meta_column_names = { "dbt_scd_id" : "dl_id", "dbt_valid_from": 'DL_EFF_START',"dbt_valid_to" : "DL_EFF_END", "dbt_is_delete": "DL_STATUS" ,"dbt_update_date": "DL_EFF_DATE"}
        )
    }}

    select * from {{ source('Exp', 'salesdet') }}
 {% endsnapshot %}