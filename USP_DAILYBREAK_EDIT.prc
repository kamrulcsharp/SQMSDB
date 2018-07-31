DROP PROCEDURE HR.USP_DAILYBREAK_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_DailyBreak_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_dailyBreak_id number
) is

BEGIN
   
   open po_cursor for select *  from tblDailyBreak where daily_break_id=p_dailyBreak_id;
END;
/
