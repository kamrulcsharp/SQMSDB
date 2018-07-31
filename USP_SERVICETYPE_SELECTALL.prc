DROP PROCEDURE HR.USP_SERVICETYPE_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceType_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select * from tblservicetype' ;
BEGIN
   open po_cursor for select * from tblservicetype;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END;
END;
/
