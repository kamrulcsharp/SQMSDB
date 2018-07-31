DROP PROCEDURE HR.SP_DATELISTTOKEN;

CREATE OR REPLACE PROCEDURE HR.sp_DateListToken (
p_date DATE, cur OUT SYS_REFCURSOR)
as
begin
-- Author:    <Kamrul Hasan>
-- Create date: <2018/04/13>
open cur for select t.token_no,t.service_date,brn.branch_name,t.contact_no,au.UserName  from tblTokenQueue t
left join  tblBranch brn
on brn.branch_id=t.branch_id
Left Join tblCounter tbq
on tbq.counter_id=t.counter_id
left join AspNetUsers au
on au.Id=t.user_id
left join tblServiceStatus st
on st.service_status_id=t.service_status_id
Where t.service_date=p_date;

END;
/
