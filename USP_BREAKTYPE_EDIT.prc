DROP PROCEDURE HR.USP_BREAKTYPE_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_BreakType_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_breakType_id number
) is

BEGIN
   
   open po_cursor for select *  from tblBreakType where break_type_id=p_breakType_id;
END;
/
