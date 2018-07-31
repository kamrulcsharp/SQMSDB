DROP PROCEDURE HR.USP_BREAKTYPE_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_BreakType_Insert
(p_break_type_name varchar2,p_break_type_short_name varchar2,p_duration number,
p_start_time date,p_end_time date
, po_PKValue out number)

IS
Begin
INSERT INTO tblBreakType
           (break_type_name,
           break_type_short_name,
           duration,
           start_time,
           end_time )
           
     VALUES
           (p_break_type_name,
           p_break_type_short_name,
           p_duration,
           p_start_time,
           p_end_time
           );  
       
 select break_type_id into po_PKValue from tblBreakType 
 where break_type_name=p_break_type_name and break_type_short_name= p_break_type_short_name and duration=p_duration and start_time = p_start_time and end_time= p_end_time;   
End;
/
