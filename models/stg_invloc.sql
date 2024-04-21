with INVLOC as(
select LOC,
	LOC_LABEL,
	LOCTYPE,
	LOCTYPE_LABEL
from retail_db.public.INVLOC
)

select * from INVLOC