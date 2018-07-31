DROP PROCEDURE HR.USP_BRANCHUSERS_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_BranchUsers_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select bu.user_branch_id,br.branch_name,us.Hometown,us.UserName,ro.Name from tblBranchUser bu inner join AspNetUserRoles ur
on ur.UserId=bu.user_id
inner join AspNetRoles ro on ro.Id=ur.RoleId
inner join tblBranch br on br.branch_id=bu.branch_id
inner join AspNetUsers us on us.Id=bu.user_id' ;
IF(quer IS NOT NULL) THEN
   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
