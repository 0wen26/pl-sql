
-- crear tabla resum_empleat

CREATE TABLE Resum_Empleat (
    IdProducte number(6),
    Total_Facturat number(8,2)
);

--drop table Resum_Empleat

--ejercicio 2

create or replace procedure comprovacion_product (p_prodid number,p_total_facturat NUMBER) IS
    v_productId number(6); 
BEGIN

    select IdProducte
    into  v_productId
    from Resum_empleat
    where IdProducte = p_prodid;

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

-- ejercicio 1

create or replace FUNCTION check_1 (p_codi_emp number)
RETURN boolean is
       v_codi_emp varchar2(9);

begin
  select job
    into v_codi_emp
    from emp
   where p_codi_emp = empno;
   if v_codi_emp = 'SALESMAN' then
        RETURN TRUE;
        --dbms_output.put_line('no existe el empleado');
    else
       RAISE_APPLICATION_ERROR (-20215, 'NO ES UN SALESMAN');
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND then
        dbms_output.put_line('no existe el empleado');

end;



