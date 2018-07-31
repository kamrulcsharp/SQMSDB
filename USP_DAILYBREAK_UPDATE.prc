DROP PROCEDURE HR.USP_DAILYBREAK_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_DailyBreak_Update
 
(p_break_type_id number,p_counter_id number,p_start_time date,
p_end_time date,p_user_id varchar2,p_remarks varchar2,
p_dailyBreak_id number
)

IS
Begin
Update  tblDailyBreak
           set break_type_id = p_break_type_id,
          counter_id=p_counter_id,
           user_id=p_user_id,
           start_time=p_start_time,
           end_time=p_end_time,
           remarks=p_remarks 
     where daily_break_id = p_dailyBreak_id;
End;
/
