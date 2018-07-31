DROP PROCEDURE HR.USP_SERVICEDETAIL_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_SERVICEDETAIL_INSERT (
   P_TOKEN_ID              IN NUMBER,
   P_CONTACT_NO            IN VARCHAR,
   P_START_TIME            IN DATE,
   P_SERVICE_SUB_TYPE_ID   IN NUMBER,
   P_ISSUES                IN VARCHAR2,
   P_SOLUTIONS             IN VARCHAR2,
   P_CUSTOMER_NAME         IN VARCHAR2,
   P_ADDRESS               IN VARCHAR2)
IS
   /******************************************************************************
      NAME:       USP_DAILYSERVICE_NEWCALL
      PURPOSE:    CALLING NEW CUSTOMER FOR SERVICE WITH NEW TOKEN

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        7/28/2018   KAMRUL       1. Created this procedure.
   ******************************************************************************/


   P_ROWCOUNT_CUSTOMER   NUMBER := 0;
   P_CUSTOMER_ID         NUMBER := 0;
BEGIN
   SELECT COUNT (1)
     INTO P_ROWCOUNT_CUSTOMER
     FROM TBLCUSTOMER C
    WHERE C.CONTACT_NO = P_CONTACT_NO;

   IF (P_ROWCOUNT_CUSTOMER > 0)
   THEN
      UPDATE TBLCUSTOMER
         SET customer_name = P_CUSTOMER_NAME, ADDRESS = P_ADDRESS
       WHERE CONTACT_NO = P_CONTACT_NO;
   ELSE
      INSERT INTO TBLCUSTOMER (customer_name,
                               ADDRESS,
                               CONTACT_NO,
                               customer_type_id)
           VALUES (P_CUSTOMER_NAME,
                   P_ADDRESS,
                   P_CONTACT_NO,
                   1);
   END IF;

   SELECT CUSTOMER_ID
     INTO P_CUSTOMER_ID
     FROM TBLCUSTOMER C
    WHERE C.CONTACT_NO = P_CONTACT_NO;

   UPDATE TBLTOKENQUEUE
      SET service_status_id = 3, contact_no = P_CONTACT_NO
    WHERE TOKEN_ID = P_TOKEN_ID;

   INSERT INTO TBLSERVICEDETAIL (token_id,
                                customer_id,
                                service_sub_type_id,
                                issues,
                                solutions,
                                start_time,
                                service_datetime,
                                end_time)
        VALUES (P_TOKEN_ID,
                P_CUSTOMER_ID,
                P_SERVICE_SUB_TYPE_ID,
                P_ISSUES,
                P_SOLUTIONS,
                P_START_TIME,
                SYSDATE,
                SYSDATE);
END;
/
