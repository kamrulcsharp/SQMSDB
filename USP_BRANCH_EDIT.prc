DROP PROCEDURE HR.USP_BRANCH_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_Branch_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_branch_id number
) is

BEGIN
   --open po_cursor for select * from tblservicetype;
   open po_cursor for select *  from tblbranch where branch_id=p_branch_id;
END;
/
