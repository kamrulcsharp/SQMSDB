DROP PROCEDURE HR.USP_DAILYBREAK_DELETE;

CREATE OR REPLACE PROCEDURE HR.USP_DailyBreak_Delete
 
(
p_dailyBreak_id number 
)
IS

BEGIN
      DELETE FROM tblDailyBreak
            
     where daily_break_id=p_dailyBreak_id;
            
End;
/
