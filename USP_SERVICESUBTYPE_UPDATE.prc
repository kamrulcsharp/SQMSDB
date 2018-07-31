DROP PROCEDURE HR.USP_SERVICESUBTYPE_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceSubType_Update
 
(p_servicesub_type_name varchar2,p_service_type_id number,p_max_duration number,
p_servicesub_type_id number
)

IS
Begin
Update  tblservicesubtype
           set service_sub_type_name = p_servicesub_type_name,
          max_duration=p_max_duration,
           service_type_id=p_service_type_id
     where service_sub_type_id = p_servicesub_type_id;
            
    
End;
/
