DROP PROCEDURE HR.GETINPROGRESSTOKENLIST;

CREATE OR REPLACE PROCEDURE HR.GetInProgressTokenList (
  -- Add the parameters for the stored procedure here
    p_branch_id number, cur OUT SYS_REFCURSOR)
AS
BEGIN
-- =============================================
-- Author:    MD. SAIFULLAH AL AZAD
-- Create date: 19-APR-2018
-- Description: <Description,,>
-- exec GetInProgressTokenList 5
-- =============================================

  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.

    -- Insert statements for procedure here
    open cur for select 
      b.static_ip,
      c.counter_no,
      NVL(cast(t.token_no as varchar2(10)),'ON') token_no
    from 
      tblCounter c
    inner join 
      tblBranch b on c.branch_id=b.branch_id
    left join
      (
        select * 
        from tblTokenQueue 
        where service_status_id=2 
              AND TO_DATE(service_date, 'DD/MM/YYYY') >= TO_DATE(systimestamp, 'DD/MM/YYYY')
      ) t on c.counter_id=t.counter_id
    where
      b.branch_id=p_branch_id;
END;
/
