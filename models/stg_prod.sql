with PROD as(
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
)
select * from Prod
