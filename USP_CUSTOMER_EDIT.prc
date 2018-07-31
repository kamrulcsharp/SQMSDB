DROP PROCEDURE HR.USP_CUSTOMER_EDIT;

CREATE OR REPLACE PROCEDURE HR.USP_Customer_Edit
(
 po_cursor OUT SYS_REFCURSOR,p_customer_id number
) is

BEGIN
   --open po_cursor for select * from tblservicetype;
   open po_cursor for select *  from tblcustomer where customer_id=p_customer_id;
END;
/
