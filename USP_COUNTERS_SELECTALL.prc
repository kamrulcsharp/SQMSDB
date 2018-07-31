DROP PROCEDURE HR.USP_COUNTERS_SELECTALL;

CREATE OR REPLACE PROCEDURE HR.USP_Counters_SelectAll
(
po_cursor OUT SYS_REFCURSOR
) is
quer varchar2(500) := ' ';
BEGIN
quer:='select con.counter_id,br.branch_name,con.counter_no,con.location from tblCounter con inner join tblBranch br
on br.branch_id=con.branch_id' ;
IF(quer IS NOT NULL) THEN

   
   open po_cursor for quer;
   --open po_cursor for select 'dasdasd' Namee, 7 numberss from dual;
END IF;
END;
/
