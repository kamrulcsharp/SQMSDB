DROP PROCEDURE HR.USP_BREAKTYPE_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_BreakType_Update
 
(p_break_type_name varchar2,p_break_type_short_name varchar2,p_duration number,
p_start_time date,p_end_time date,
p_breakType_id number
)

IS
Begin
Update  tblBreakType
           set break_type_name = p_break_type_name,
          break_type_short_name=p_break_type_short_name,
           duration=p_duration,
           start_time=p_start_time,
           end_time=p_end_time
     where break_type_id = p_breakType_id;
            
    
End;
/
