DROP PROCEDURE HR.GETNEXTTOKENLIST;

CREATE OR REPLACE PROCEDURE HR.GetNextTokenList (
   p_branch_id number, cur OUT SYS_REFCURSOR)
AS
BEGIN
-- =============================================
-- Author:    MD. SAIFULLAH AL AZAD
-- Create date: 19-APR-2018
-- Description: <Description,,>
-- =============================================
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.

    -- Insert statements for procedure here
  open cur for select
    b.static_ip,
    b.display_next,
    t.token_no

  from
    tblTokenQueue t
  inner join
    tblBranch b on t.branch_id=b.branch_id
  where
    t.branch_id=p_branch_id
    and service_status_id=1
    and service_date=systimestamp;
END;
/
