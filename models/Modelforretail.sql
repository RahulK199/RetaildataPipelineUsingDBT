--select * from RETAIL_DB.PUBLIC.HLDY


with averagecosts as(
select SKU_ID,AVERAGE_UNIT_STANDARDCOST, AVERAGE_UNIT_LANDEDCOST
from RETAIL_DB.PUBLIC.AVEARAGECOSTS
),


CLND as(
select FSCLDT_ID,
   FSCLDT_LABEL,
   FSCLWK_ID,
   FSCLWK_LABEL,
   FSCLMTH_ID,
   FSCLMTH_LABEL,
   FSCLQRTR_ID,
   FSCLQRTR_LABEL,
   FSCLYR_ID,
   FSCLYR_LABEL,
   SSN_ID,
   SSN_LABEL,
   LY_FSCLDT_ID,
   LLY_FSCLDT_ID,
   FSCLDOW,
   FSCLDOM,
   FSCLDOQ,
   FSCLDOY,
   FSCLWOY,
   FSCLMOY,
   FSCLQOY,
   DATE
from retail_db.public.CLND
),

HLDY as(
    select HLDY_ID, HLDY_LABEL
    from retail_db.public.HLDY
),

INVLOC as(
select LOC,
	LOC_LABEL,
	LOCTYPE,
	LOCTYPE_LABEL
from retail_db.public.INVLOC
),

INVSTATUS as(
select CODE_ID,
	CODE_LABEL,
	BCKT_ID,
	BCKT_LABEL,
	OWNRSHP_ID,
	OWNRSHP_LABEL 
from RETAIL_DB.RETAIL_SCHEMA.INVSTATUS 
),

POSSITE as(
select SITE_ID ,
	SITE_LABEL ,
	SUBCHNL_ID ,
	SUBCHNL_LABEL ,
	CHNL_ID ,
	CHNL_LABEL
from retail_db.public.POSSITE
),



PRICESTATE as(
select SUBSTATE_ID,
	SUBSTATE_LABEL,
	STATE_ID,
	STATE_LABEL 
from retail_db.public.PRICESTATE
),

PROD as(
select SKU_ID,
	SKU_LABEL,
	STYLCLR_ID ,
	STYLCLR_LABEL ,
	STYL_ID ,
	STYL_LABEL ,
	SUBCAT_ID ,
	SUBCAT_LABEL ,
	CAT_ID ,
	CAT_LABEL ,
	DEPT_ID ,
	DEPT_LABEL ,
	ISSVC ,
	ISASMBLY ,
	ISNFS 
from retail_db.public.PROD
),

RTLLOC as(
select STR ,
	STR_LABEL,
	DSTR,
	DSTR_LABEL,
	RGN,
	RGN_LABEL
from retail_db.public.RTLLOC
),

TRANSACTIONS as(
select ORDER_ID ,
	LINE_ID ,
	TYPE ,
	DT ,
	POS_SITE_ID ,
	SKU_ID,
	FSCLDT_ID,
	PRICE_SUBSTATE_ID,
	SALES_UNITS ,
	SALES_DOLLARS ,
	DISCOUNT_DOLLARS,
	ORIGINAL_ORDER_ID,
	ORIGINAL_LINE_ID
from retail_db.public.TRANSACTIONS
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

