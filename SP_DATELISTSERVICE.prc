DROP PROCEDURE HR.SP_DATELISTSERVICE;

CREATE OR REPLACE PROCEDURE HR.sp_DateListService (
p_date DATE, cur OUT SYS_REFCURSOR)
as
begin
-- Author:    <Kamrul Hasan>
-- Create date: <2018/04/13>
open cur for select s.token_id,s.issues,s.service_datetime,s.start_time,s.end_time,
s.solutions,s.customer_id,cus.customer_name,cus.contact_no,au.UserName,tbq.service_status_id  from tblServiceDetail s
left join  tblCustomer cus
on cus.customer_id=s.customer_id
Left Join tblTokenQueue tbq
on tbq.token_id=s.token_id
Left Join AspNetUsers au
on au.Id=tbq.user_id
Where s.end_time=p_date;

END;
/
