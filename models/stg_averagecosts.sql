with averagecosts as(
select SKU_ID,AVERAGE_UNIT_STANDARDCOST, AVERAGE_UNIT_LANDEDCOST
from RETAIL_DB.PUBLIC.AVEARAGECOSTS
)

select * from averagecosts