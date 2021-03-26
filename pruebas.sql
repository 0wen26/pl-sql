 declare
 v_productId number(6); 
BEGIN

    select IdProducte
    into  v_productId
    from Resum_empleat
    where IdProducte = 005;

    IF v_productId IS NOT NULL THEN
        INSERT INTO RESUM_EMPLEAT (IdProducte,TOTAL_FACTURAT)
        VALUES (v_productId,p_total_facturat);
        dbms_output.put_line('insertado');
    ELSE
        update RESUM_EMPLEAT
        set IdProducte =p_prodid, Total_Facturat=p_total_facturat
        where IdProducte = p_prodid;
        dbms_output.put_line('update');
    end if;

end;