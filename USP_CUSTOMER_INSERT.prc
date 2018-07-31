DROP PROCEDURE HR.USP_CUSTOMER_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_Customer_Insert
 
(p_customer_name varchar2,p_contact_no varchar2,p_address varchar2,p_customer_type_id number

, po_PKValue out number)

IS
Begin


 
INSERT INTO tblcustomer
           (customer_name,
           contact_no,
           address,
           customer_type_id
           )
           
     VALUES
           (p_customer_name,
           p_contact_no,
           p_address,
           1);  
       
 select customer_id into po_PKValue from tblcustomer 
 where customer_name=p_customer_name and contact_no= p_contact_no  and address=p_address ;   
End;
/
