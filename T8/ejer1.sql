/*
CREATE TABLE messages(
results VARCHAR2(100));
*/
--drop table messages;

DECLARE
   /*
   b) En la secció de declaracions, declara dues variables: v_ename de tipus employees.last_name i
      v_emp_sal del tipus employees.salary.
      Inicialitza l'última en 6000
   */
   v_ename employees.last_name%type;
   v_emp_sal employees.salary%type :=2000;

BEGIN
   /*
      c) En la secció executable, recupera els cognoms dels empleats amb salaris iguals al valor de v_emp_sal.
         Si el salari introduït torna només una fila, afegeix en la taula messages el nom i el import del salari de
         l'empleat.
         Nota: no utilitzis cursors explícits.
   */
   SELECT last_name,salary into v_ename,v_emp_sal
   from employees
   where salary = v_emp_sal;

   insert into messages (results)
   values (v_ename || ' - ' || v_emp_sal);

EXCEPTION
   /*
      d) Si el salari introduït no torna cap fila, manega l'excepció amb un manegador d'excepcions adequat i
         afegeix en la taula messages el missatge "No employee with a salary of <salary>"
   */
   when NO_DATA_FOUND THEN
      insert into messages (results)
      values ('No employee with a salary of '||v_emp_sal);
   
   /*
       Si el salari introduït torna varies files, manega l'excepció amb un manegador d'excepcions adequat i
      afegeix en la taula messages el missatge "More than one employee with a salary of <salary>".
   */
   when TOO_MANY_ROWS THEN
      insert into messages (results)
      values ('More than one employee with a salary of '|| v_emp_sal);

   /*
      Manega qualsevol altra excepció amb un manegador d'excepcions adequat i afegix en la taula
      messages el missatge "Some other error ocurred
   */
   when others THEN
      insert into messages (results)
      values ('Some other error ocurred');

END;
/
select * from messages;