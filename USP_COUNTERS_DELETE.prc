DROP PROCEDURE HR.USP_COUNTERS_DELETE;

CREATE OR REPLACE PROCEDURE HR.USP_Counters_Delete
 
(
p_Counter_id number 
)

IS

BEGIN
      DELETE FROM tblcounter
      
           
     where counter_id=p_Counter_id;
            
    
End;
/
