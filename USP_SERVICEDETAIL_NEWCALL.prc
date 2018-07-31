DROP PROCEDURE HR.USP_SERVICEDETAIL_NEWCALL;

CREATE OR REPLACE PROCEDURE HR.USP_SERVICEDETAIL_NEWCALL (
   P_BRANCH_ID        IN     NUMBER,
   P_COUNTER_ID       IN     NUMBER,
   P_USER_ID          IN     VARCHAR,
   PO_TOKEN_ID           OUT NUMBER,
   PO_TOKEN_NO           OUT NUMBER,
   PO_CONTACT_NO         OUT VARCHAR2,
   PO_SERVICE_TYPE       OUT VARCHAR2,
   PO_START_TIME         OUT DATE,
   PO_CUSTOMER_NAME      OUT VARCHAR2,
   PO_ADDRESS            OUT VARCHAR2,
   PO_CURSOR             OUT SYS_REFCURSOR)
IS
   P_ROWCOUNT_TOKEN      NUMBER := 0;
   P_ROWCOUNT_CUSTOMER   NUMBER := 0;
   P_TOKEN_ID            NUMBER := 0;
   P_SERVICE_TYPE_ID     NUMBER := 0;
   P_TOKEN_NO            NUMBER := 0;
   P_CUSTOMER_NAME       VARCHAR2 (150);
   P_ADDRESS             VARCHAR2 (250);
   P_CONTACT_NO          VARCHAR2 (150);
   P_SERVICE_TYPE        VARCHAR2 (100);
/******************************************************************************
   NAME:       USP_DAILYSERVICE_NEWCALL
   PURPOSE:    CALLING NEW CUSTOMER FOR SERVICE WITH NEW TOKEN

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        7/28/2018   KAMRUL       1. Created this procedure.
******************************************************************************/

BEGIN
     SELECT COUNT (1)
       INTO P_ROWCOUNT_TOKEN
       FROM TBLTOKENQUEUE T
      WHERE     (   (T.counter_id = P_COUNTER_ID AND T.service_status_id = 2)
                 OR (    T.counter_id IS NULL
                     AND T.service_status_id = 1
                     AND T.branch_id = P_BRANCH_ID))
            AND TRUNC (T.service_date) = TRUNC (SYSDATE)
   ORDER BY T.token_id ASC;

   IF (P_ROWCOUNT_TOKEN > 0)
   THEN
      SELECT *
        INTO P_TOKEN_ID,
             P_TOKEN_NO,
             P_CONTACT_NO,
             P_SERVICE_TYPE_ID,
             P_SERVICE_TYPE
        FROM (  SELECT T.TOKEN_ID,
                       T.TOKEN_NO,
                       T.CONTACT_NO,
                       S.SERVICE_TYPE_ID,
                       S.SERVICE_TYPE_NAME
                  FROM TBLTOKENQUEUE T
                       INNER JOIN TBLSERVICETYPE S
                          ON T.SERVICE_TYPE_ID = S.SERVICE_TYPE_ID
                 WHERE     (   (    T.counter_id = P_COUNTER_ID
                                AND T.service_status_id = 2)
                            OR (    T.counter_id IS NULL
                                AND T.service_status_id = 1
                                AND T.branch_id = P_BRANCH_ID))
                       AND TRUNC (T.service_date) = TRUNC (SYSDATE)
              ORDER BY T.token_id ASC) TBL
       WHERE ROWNUM <= 1;
   END IF;

   IF (P_ROWCOUNT_TOKEN > 0)
   THEN
      UPDATE TBLTOKENQUEUE
         SET service_status_id = 2,
             counter_id = P_COUNTER_ID,
             user_id = P_USER_ID
       WHERE token_id = P_TOKEN_ID;

      UPDATE TBLDAILYBREAK
         SET end_time = SYSDATE
       WHERE user_id = P_USER_ID AND end_time IS NULL;
   END IF;

   SELECT COUNT (1)
     INTO P_ROWCOUNT_CUSTOMER
     FROM TBLCUSTOMER
    WHERE contact_no = P_CONTACT_NO;

   IF (P_ROWCOUNT_TOKEN > 0 AND P_ROWCOUNT_CUSTOMER > 0)
   THEN
      SELECT customer_name, address
        INTO P_CUSTOMER_NAME, P_ADDRESS
        FROM TBLCUSTOMER
       WHERE contact_no = P_CONTACT_NO;
   END IF;

   IF (P_ROWCOUNT_TOKEN > 0)
   THEN
      PO_TOKEN_ID := P_TOKEN_ID;
      PO_TOKEN_NO := P_TOKEN_NO;
      PO_CONTACT_NO := P_CONTACT_NO;
      PO_SERVICE_TYPE := P_SERVICE_TYPE;
      PO_CUSTOMER_NAME := P_CUSTOMER_NAME;
      PO_ADDRESS := P_ADDRESS;
      PO_START_TIME := SYSDATE;

      --SELECT PO_TOKEN_ID, PO_SERVICE_TYPE, PO_CONTACT_NO INTO TBL_USP_SERVICEDETAIL_NEWCALL FROM DUAL; 
      
      OPEN PO_CURSOR FOR
         SELECT SST.*
           FROM TBLSERVICESUBTYPE SST
           WHERE SST.SERVICE_TYPE_ID=P_SERVICE_TYPE_ID;

      COMMIT;
   END IF;
END;
/
