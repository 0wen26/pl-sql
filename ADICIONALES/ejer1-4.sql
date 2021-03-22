/*
    Crea el procediment Afegir_Pressupost_Dept que rebrà com a paràmetres
    el nom del departament, el identificador del manager del departament
    i el total dels salaris revisats del departament, i obtindrà el nom i
    cognom del manager del departament i afegirà un nou registre a la taula
    PRESSUPOST2 amb la informació corresponent.
*/


CREATE OR REPLACE PROCEDURE Afegir_Pressupost_Dept (
p_manager_id departments.manager_id%type, 
p_dept_name departments.department_name%type, 
p_total_salaris pressupost2.total_salaris%type) IS
    
    v_first_name EMPLOYEES.FIRST_NAME%TYPE;
    v_last_name EMPLOYEES.LAST_NAME%TYPE;

    begin
      select first_name , last_name
        into v_first_name,v_last_name
        from employees
       where employee_id  = p_manager_id;

    insert into pressupost2
    VALUES (p_dept_name, v_first_name, v_last_name, p_total_salaris);

    end;