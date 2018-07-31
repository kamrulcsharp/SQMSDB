DROP PROCEDURE HR.USP_GETNEXTTOKENLIST;

CREATE OR REPLACE PROCEDURE HR.USP_GetNextTokenList (
   p_branch_id number, cur OUT SYS_REFCURSOR)
AS
BEGIN
  
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
