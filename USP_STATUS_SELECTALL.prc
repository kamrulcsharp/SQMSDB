DROP PROCEDURE HR.USP_STATUS_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_Status_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select * from tblServiceStatus' ;
IF(quer IS NOT NULL) THEN
   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
