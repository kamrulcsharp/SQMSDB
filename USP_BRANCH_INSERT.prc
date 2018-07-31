DROP PROCEDURE HR.USP_BRANCH_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_Branch_Insert
 
(p_branch_id number,p_user_id number,
po_PKValue out number)

IS
Begin
INSERT INTO tblbranchuser
           (branch_id,
           user_id)
           
     VALUES
           (p_branch_id,
           p_user_id);
           select user_branch_id into po_PKValue from tblbranchuser 
 where branch_id=p_branch_id and user_id=p_user_id;      
End;
/
