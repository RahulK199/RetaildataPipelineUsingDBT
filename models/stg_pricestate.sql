with PRICESTATE as(
select SUBSTATE_ID,
	SUBSTATE_LABEL,
	STATE_ID,
	STATE_LABEL 
from retail_db.public.PRICESTATE
)
select * from PRICESTATE