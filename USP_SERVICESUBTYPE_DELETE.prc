DROP PROCEDURE HR.USP_SERVICESUBTYPE_DELETE;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceSubType_Delete
 
(
p_servicesub_type_id number 
)

IS

BEGIN
      DELETE FROM tblservicesubtype
      
           
     where service_sub_type_id=p_servicesub_type_id;
            
    
End;
/
