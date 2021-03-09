
set serveroutput on

DECLARE
   /* 
      a) Declara dues variables: v_dept_name de tipus departments.department_name i v_dept_id de tipo NUMBER
        Assigna 'Eduction' a v_dept_name en la secció de declaracions.
   */
   v_dept_name departments.department_name%type:='Education';
   v_dept_id number;
   v_max_deptno number;
BEGIN
   /*
      b) Inicia la secció executable amb les paraules BEGIN e inclou una sentència SELECT per recupera el
         valor màxim de department_id de la taula departments.
   */
   select max(department_id)
     into v_max_deptno
     from departments;
   /*
      Ja has recuperat el número de departament superior actual de la taula departments. Suma-li 10 i
        assigna-li el resultat a v_dept_id.
   */
    v_dept_id:=v_max_deptno+10;

    /*
        Inclou una sentència INSERT per insertar dades en les columnes department_name, department_id y
        location_id de la taula departments.
        Utilitza valors en dept_name i dept_id per a department_name i department_id, respectivament, i utilitza
        NULL per a location_id.
    */
    insert into departments (department_name,department_id,location_id)
    values (v_dept_name,v_dept_id,null);
    /*
        Utilitza l'atribut SQL SQL%ROWCOUNT per mostrar el número de files que es veuen afectades.
    */


   dbms_output.put_line('The maximum deptartment_id is : ' || v_max_deptno || 
                         ' gives ' || sql%rowcount );

end;
/
/*
    Executa una sentència SELECT per comprovar si s'ha afegit el nou departament. Acaba el bloc
    PL/SQL amb "/" e inclou una sentència SELECT en el script.
*/
select *  
  from departments;
