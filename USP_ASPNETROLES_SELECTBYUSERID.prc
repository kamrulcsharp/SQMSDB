DROP PROCEDURE HR.USP_ASPNETROLES_SELECTBYUSERID;

CREATE OR REPLACE PROCEDURE HR.USP_AspNetRoles_SelectByUserId (
   p_user_id       VARCHAR2,
   po_cursor   OUT SYS_REFCURSOR)
IS
BEGIN
   --open po_cursor for select * from tblservicetype;

   OPEN po_cursor FOR
      SELECT R.*
        FROM ASPNETROLES R
             INNER JOIN ASPNETUSERROLES UR ON R.ID = UR.ROLEID
       WHERE UR.USERID = p_user_id;
END;
/
