DROP PROCEDURE HR.USP_SERVICESUBTYPE_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceSubType_Insert
(p_servicesub_type_name varchar2,p_service_type_id number,p_max_duration number

, po_PKValue out number)

IS
Begin


 
INSERT INTO tblservicesubtype
           (service_sub_type_name,
           service_type_id,
           max_duration )
           
     VALUES
           (p_servicesub_type_name,
           p_service_type_id,p_max_duration
           );  
       
 select service_type_id into po_PKValue from tblservicesubtype 
 where service_sub_type_name=p_servicesub_type_name and service_type_id= p_service_type_id and max_duration=p_max_duration;   
End;
/
