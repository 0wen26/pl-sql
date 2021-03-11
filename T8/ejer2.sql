DECLARE
    /*
        a) En la secció de declaracions, declara una excepció e_childrecord_exists.
            Associa l'excepció declarada al error d'Oracle Server estàndard -02292.    
    */

    e_childrecord_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_childrecord_exists, -02292);

begin
  /*
    b) En la secció executable, mostra "Deleting department 40...".
       Inclou una sentència DELETE per suprimir el departament amb department_id 40.
  */
  dbms_output.put_line('Deleting department 40...');
  delete from departments
   where department_id = 40;
    
exception

    /*
    c) Inclou una secció d'excepcions per manegar l'excepció e_childrecord_exists 
      i mostra el missatge adequat
    */
  when e_childrecord_exists then
    dbms_output.put_line('Cannot delete this department. There are employees in this
                          department(child records exist)');
end;
/
select * from departments;
