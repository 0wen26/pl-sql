/*
    Refès el bloc anònim anterior per tal de que utilitzant el procediment anterior afegeixi 
    tots els departaments a la taula PRESSUPOST2. Tracta l'excepció que es produiria si el 
    procediment no troba el manager per a un departament ('Error: No existeix el manager d'aquest
     departament') i qualsevol altre excepció que es pugui produir (codi d'error i missatge d'oracle).
*/

DECLARE
    cursor c_dept_cursor IS
    select department_id,department_name,manager_id
      from departments
     where manager_id IS NOT NULL;

     v_total_salaris number(8,2);
     v_err_num number;
     v_err_msg varchar2(100);

begin
  for v_dept_record in c_dept_cursor  loop

      v_total_salaris:= total_salari_dept(v_dept_record.department_id);
      afegir_pressupost_dept(v_dept_record.manager_id,v_dept_record.department_name,v_total_salaris);
    
  end loop;

EXCEPTION

    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('ERROR');

    when others then

    v_err_num:= SQLCODE;
    V_ERR_MSG := substr(SQLERRM,1,100);
    dbms_output.put_line('erroraco');

end;
/
select * from pressupost2