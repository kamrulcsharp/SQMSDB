DROP PROCEDURE HR.USP_SERVICESUBTYPE_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_ServiceSubType_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='Select sst.service_sub_type_id, st.service_type_name,sst.service_sub_type_name,sst.max_duration from tblServiceSubType sst
inner join tblServiceType st on  sst.service_type_id = st.service_type_id' ;
IF(quer IS NOT NULL) THEN

   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
