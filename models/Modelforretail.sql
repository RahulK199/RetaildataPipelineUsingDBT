--select * from RETAIL_DB.PUBLIC.HLDY
{{config(
    materialized = "view"
)}}

with averagecosts as(
select *
from {{ref("stg_averagecosts")}}
),


CLND as(
select *
from {{ref("stg_clnd")}}
),

HLDY as(
    select *
    from {{ref("stg_hldy")}}
),

INVLOC as(
select *
from {{ref("stg_invloc")}}
),

INVSTATUS as(
select * 
from {{ref("stg_invstatus")}}
),

POSSITE as(
select *
from {{ref("stg_possite")}}
),



PRICESTATE as(
select * 
from {{ref("stg_pricestate")}}
),

PROD as(
select *
from {{ref("stg_prod")}}
),

RTLLOC as(
select *
from {{ref("stg_RTLLOC")}}
),

TRANSACTIONS as(
select *
from {{ref("stg_transactions")}}
),

mview_weekly_sales as (
select 
sum(sales_units) over(partition by pos_site_id, sku_id, fsclwk_id, price_substate_id, [type]),
sum(sales_dollars) over(partition by pos_site_id, sku_id, fsclwk_id, price_substate_id, [type]), 
sum(discount_dollars) over(partition by pos_site_id, sku_id, fsclwk_id, price_substate_id, [type]),
pos_site_id, 
sku_id, 
fsclwk_id, 
price_substate_id,
[type]
from TRANSACTIONS tx
inner join clnd cl
on tx.FSCLDT_ID = cl.FSCLDT_ID

)

select * from mview_weekly_sales

