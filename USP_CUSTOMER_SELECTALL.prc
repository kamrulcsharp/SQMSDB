DROP PROCEDURE HR.USP_CUSTOMER_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_Customer_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select cus.customer_id,cus.customer_name,cus.contact_no,cus.address,ct.customer_type_name from tblCustomer cus
 inner join tblCustomerType ct on ct.customer_type_id=cus.customer_type_id' ;
IF(quer IS NOT NULL) THEN
   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
