DROP PROCEDURE HR.USP_SERVICEDETAIL_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceDetail_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select sd.service_id,tq.token_no,au.UserName,cus.customer_name,sd.issues,sd.solutions,sd.service_datetime,sd.start_time,sd.end_time,
sst.service_sub_type_name from tblServiceDetail sd inner join tblTokenQueue tq on tq.token_id=sd.token_id
inner join tblCustomer cus on cus.customer_id=sd.customer_id
inner join tblServiceSubType sst on sst.service_sub_type_id=sd.service_sub_type_id
inner join AspNetUsers au on au.Id=tq.user_id
' ;
IF(quer IS NOT NULL) THEN
   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
