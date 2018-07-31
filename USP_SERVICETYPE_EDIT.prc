DROP PROCEDURE HR.USP_SERVICETYPE_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceType_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_service_type_id number
) is

BEGIN
   --open po_cursor for select * from tblservicetype;
   open po_cursor for select *  from tblServiceType where service_type_id=p_service_type_id;
END;
/
