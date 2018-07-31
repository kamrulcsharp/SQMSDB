DROP PROCEDURE HR.USP_BRANCH_DELETE;

CREATE OR REPLACE PROCEDURE HR.USP_Branch_Delete
 
(
p_branch_id number 
)

IS

BEGIN
      DELETE FROM tblbranch
      
           
     where branch_id=p_branch_id;
            
    
End;
/
