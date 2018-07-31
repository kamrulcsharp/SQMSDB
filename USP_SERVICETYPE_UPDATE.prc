DROP PROCEDURE HR.USP_SERVICETYPE_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceType_Update
 
(p_service_type_name varchar2,
p_service_type_id number 
)

IS
Begin
Update  tblServiceType
           set service_type_name= p_service_type_name
           
     where service_type_id=p_service_type_id;
            
    
End;
/
