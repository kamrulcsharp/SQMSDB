DROP PROCEDURE HR.USP_DAILYBREAK_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_DailyBreak_Insert
(p_break_type_id number,p_counter_id number,p_start_time date,
p_end_time date,p_user_id varchar2,p_remarks varchar2
, po_PKValue out number)

IS
Begin
INSERT INTO tblDailyBreak
           (break_type_id,
           counter_id,
           start_time,
           end_time,
           user_id,
           remarks )
           
     VALUES
           (p_break_type_id,
           p_counter_id,
           p_start_time,
           p_end_time,
           p_user_id,
           p_remarks
           );  
       
 select daily_break_id into po_PKValue from tblDailyBreak 
 where break_type_id=p_break_type_id and counter_id= p_counter_id and start_time=p_start_time and user_id = p_user_id and end_time= p_end_time
 and remarks=p_remarks;   
End;
/
