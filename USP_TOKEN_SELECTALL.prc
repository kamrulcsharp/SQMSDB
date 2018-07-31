DROP PROCEDURE HR.USP_TOKEN_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_Token_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select tq.token_id,br.branch_name,tq.token_no,tq.service_date,st.service_status,tq.contact_no from tblTokenQueue tq inner join
tblBranch  br on br.branch_id=tq.branch_id 
inner join tblServiceStatus st on st.service_status_id=tq.service_status_id' ;
IF(quer IS NOT NULL) THEN
   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
