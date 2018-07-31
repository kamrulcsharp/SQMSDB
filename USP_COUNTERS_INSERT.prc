DROP PROCEDURE HR.USP_COUNTERS_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_Counters_Insert
(p_location varchar2,p_counter_no varchar2,p_branch_id number

, po_PKValue out number)

IS
Begin


 
INSERT INTO tblcounter
           (counter_no,
           branch_id,
           location )
           
     VALUES
           (p_counter_no,
           p_branch_id,
           p_location
           );  
       
 select counter_id into po_PKValue from tblcounter 
 where counter_no=p_counter_no and branch_id= p_branch_id and location=p_location;   
End;
/
