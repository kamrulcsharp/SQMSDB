DROP PROCEDURE HR.USP_CUSTOMER_UPDATE;

CREATE OR REPLACE PROCEDURE HR.USP_Customer_Update
 
(p_customer_name varchar2,p_contact_no varchar2,p_address varchar2,p_customer_type_id number,
p_customer_id number
)

IS
Begin
Update  tblcustomer
           set customer_name = p_customer_name,
           contact_no = p_contact_no,
          
           address=p_address ,
           customer_type_id=p_customer_type_id
     where customer_id = p_customer_id;
            
    
End;
/
