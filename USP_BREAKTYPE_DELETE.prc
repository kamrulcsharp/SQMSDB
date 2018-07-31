DROP PROCEDURE HR.USP_BREAKTYPE_DELETE;

CREATE OR REPLACE PROCEDURE HR.USP_BreakType_Delete
 
(
p_breakType_id number 
)
IS

BEGIN
      DELETE FROM tblBreakType
            
     where break_type_id=p_breakType_id;
            
End;
/
