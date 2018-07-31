DROP PROCEDURE HR.USP_COUNTERS_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_Counters_Update
 
(p_location varchar2,p_counter_no varchar2,p_branch_id number,
p_Counter_id number
)

IS
Begin
Update  tblcounter
           set counter_no = p_counter_no,
          branch_id=p_branch_id,
           location=p_location
     where counter_id = p_Counter_id;
            
    
End;
/
