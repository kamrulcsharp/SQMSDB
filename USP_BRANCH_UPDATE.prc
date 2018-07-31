DROP PROCEDURE HR.USP_BRANCH_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_Branch_Update
 
(p_branch_id number,p_branchuser_id number,p_user_id number
)

IS
Begin
Update  tblbranchuser
           set branch_id= p_branch_id,
           user_id= p_user_id
           
     where user_branch_id=p_branchuser_id;
            
    
End;
/
