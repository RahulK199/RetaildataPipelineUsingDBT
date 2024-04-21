with POSSITE as(
select SITE_ID ,
	SITE_LABEL ,
	SUBCHNL_ID ,
	SUBCHNL_LABEL ,
	CHNL_ID ,
	CHNL_LABEL
from retail_db.public.POSSITE
)

select * from POSSITE