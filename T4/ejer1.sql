
set serveroutput on

DECLARE
   /* 
      a) Declara una variable v_max_deptno de tipus NUMBER en la secció de declaracions
   */
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
      Mostra v_max_deptno i finalitza el bloc executable.
   */
   dbms_output.put_line('The maximum deptartment_id is : ' || v_max_deptno);

end;
/