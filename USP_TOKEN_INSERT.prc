DROP PROCEDURE HR.USP_TOKEN_INSERT;

CREATE OR REPLACE PROCEDURE HR.USP_Token_Insert
(
     p_service_type_id number
    ,p_contact_no varchar2
    ,p_branch_id number
    ,po_token_id out number
    ,po_token_no out number
)
IS

token_no number := 0;

Begin
    SELECT NVL(MAX(TOKEN_NO),0) INTO token_no
    FROM tbltokenqueue T
    WHERE T.BRANCH_ID=p_branch_id AND TRUNC(T.SERVICE_DATE) = TRUNC(SYSDATE);

    po_token_no:= token_no + 1;
    

    INSERT INTO tbltokenqueue
    (
        BRANCH_ID,
        SERVICE_TYPE_ID,
        CONTACT_NO,
        TOKEN_NO,
        SERVICE_DATE,
        SERVICE_STATUS_ID
    )
           
     VALUES
    (
        p_branch_id,
        p_service_type_id,
        p_contact_no,
        po_token_no,
        SYSDATE,
        1
    );  
       
    SELECT TOKEN_ID INTO PO_TOKEN_ID 
    FROM TBLTOKENQUEUE 
    WHERE TOKEN_NO=po_token_no
        AND BRANCH_ID = p_branch_id
        AND CONTACT_NO = p_contact_no
        AND service_type_id = p_service_type_id
        AND SERVICE_STATUS_ID = 1
        AND TRUNC(SERVICE_DATE) = TRUNC(SYSDATE);
  COMMIT;
End;
/
