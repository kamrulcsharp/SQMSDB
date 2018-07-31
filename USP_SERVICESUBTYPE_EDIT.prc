DROP PROCEDURE HR.USP_SERVICESUBTYPE_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceSubType_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_servicesub_type_id number
) is

BEGIN
   --open po_cursor for select * from tblservicetype;
   open po_cursor for select *  from tblservicesubtype where service_sub_type_id=p_servicesub_type_id;
END;
/
