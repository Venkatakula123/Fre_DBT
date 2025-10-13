{{
    config(
        materialized='table',
        pre_hook =["INSERT INTO auditlog( invocation_id,model_name ,status ,m_timestamp) values('a123','Profit_us','start',current_timestamp()) "],
        post_hook = ["INSERT INTO auditlog( invocation_id,model_name ,status ,m_timestamp) values('a123','Profit_us','end',current_timestamp()) "]
        
    )
}}
{{ generate_profit_model("SALES_US")}}