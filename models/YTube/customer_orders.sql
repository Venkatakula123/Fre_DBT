{{ config(
    materialized = 'table',
    tags = ['cust'],
    alias = 'cust_orders'
)}}

Select a.customerID,
       a.firstname || a.lastname as name,
       CAST(replace(a.phonenumber,'-','') as NUMBER) as PNUMBER,
       b.orderid,
       b.orderdate,
       b.totalamount,
       b.orderstatus  from {{source('test','Customers')}} a INNER JOIN {{source('test','orders')}} b on a.customerID = b.customerID
                      where b.orderstatus = 'Processing'