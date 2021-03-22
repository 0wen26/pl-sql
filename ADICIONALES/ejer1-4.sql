/*
    Crea el procediment Afegir_Pressupost_Dept que rebrà com a paràmetres
    el nom del departament, el identificador del manager del departament
    i el total dels salaris revisats del departament, i obtindrà el nom i
    cognom del manager del departament i afegirà un nou registre a la taula
    PRESSUPOST2 amb la informació corresponent.
*/
create or replace procedure afegir_pressupost_dept (
    p_deptno employees.department_name%type,
    p_id_manager employees.manager_id%type,
    
    )