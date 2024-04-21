with RTLLOC as(
select STR ,
	STR_LABEL,
	DSTR,
	DSTR_LABEL,
	RGN,
	RGN_LABEL
from retail_db.public.RTLLOC
)

select * from RTLLOC