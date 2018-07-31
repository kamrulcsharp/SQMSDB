DROP PROCEDURE HR.USP_SERVICETYPE_DELETE;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceType_Delete
 
(
p_service_type_id number 
)

IS

BEGIN
      DELETE FROM tblServiceType
      
           
     where service_type_id=p_service_type_id;
            
    
End;
/
