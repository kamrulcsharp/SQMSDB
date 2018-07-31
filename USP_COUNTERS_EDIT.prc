DROP PROCEDURE HR.USP_COUNTERS_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_Counters_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_Counter_id number
) is

BEGIN
   --open po_cursor for select * from tblservicetype;
   open po_cursor for select *  from tblcounter where counter_id=p_Counter_id;
END;
/
