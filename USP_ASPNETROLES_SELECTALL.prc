DROP PROCEDURE HR.USP_ASPNETROLES_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_AspNetRoles_SelectAll (
   po_cursor   OUT SYS_REFCURSOR)
IS
BEGIN
   --open po_cursor for select * from tblservicetype;

   OPEN po_cursor FOR
      SELECT *
        FROM ASPNETROLES R;
END;
/
