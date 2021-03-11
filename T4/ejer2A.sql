
DECLARE
    --Utilitzar una variable de substitució per emmagatzemar un número de departament
    v_departament number:=&deptno;
    v_max number;

BEGIN
    --Imprimir el nombre de persones que treballen en el departament especificat
    select count(EMPLOYEE_ID) 
    INTO v_max
    from EMPLOYEES
    where DEPARTMENT_ID = v_departament;
    
    dbms_output.put_line(v_max || ' employee(s) Work for departament number '|| v_departament);



END;
/