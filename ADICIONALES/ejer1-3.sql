/*
    e) En un bloc anònim PL/SQL crea un cursor que recuperi
    tots els departaments que tenen empleats (manager_id not null)
    ordenats per departament i utilitza la funció 
    de l'apartat a) per omplir la taula PRESSUPOST convenientment.

*/
set serveroutput on;


Declare
    cursor c_dep_emp IS 
    select  department_id,department_name
      from DEPARTMENTS
     where manager_id is not null
     order by department_name;
    v_result number(8,2);

begin
    for v_emp_record in c_dep_emp
    loop
        v_result := total_salari_dept(v_emp_record.department_id);
        insert into pressupost
        (NOM_DEPARTMENT,TOTAL_SALARIS)
        VALUES
        (v_emp_record.department_name,v_result);
    end loop;
COMMIT;
end;
/
--drop table pressupost;
select * from pressupost;
/*
CREATE TABLE PRESSUPOST(
Nom_Department VARCHAR2(30) PRIMARY KEY, 
Total_Salaris NUMBER(8,2));
*/
