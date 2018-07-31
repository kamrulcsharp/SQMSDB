DROP PROCEDURE HR.USP_SERVICETYPE_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceType_Insert
 
(p_service_type_name varchar2,
po_PKValue out number)

IS
Begin
INSERT INTO tblServiceType
           (service_type_name)
           
     VALUES
           (p_service_type_name);
           select service_type_id into po_PKValue from tblServiceType 
 where service_type_name=p_service_type_name;      
End;
/
