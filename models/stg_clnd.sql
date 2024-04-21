with CLND as(
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
)

select * from clnd
