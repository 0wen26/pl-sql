DECLARE
    /*
        Declare una taula INDEX BY dept_table_type del tipus departments.department_name.
        Declara una variable my_dept_table del tipus dept_table_type per emmagatzema
        temporalment els noms dels departaments.    
    */
    TYPE dept_table_type IS TABLE OF
        departments.department_name%type
    index BY pls_integer;

    my_dept_table dept_table_type;
    
    --Declara dues variables: f_loop_count i v_deptno del tipus NUMBER.
    -- Assigna 10 a f_loop_count i 0 a v_deptno.
    f_loop_count number:=10;
    v_deptno number:=0;
    
begin
  
  /*
    Amb un bucle, recupera els noms de 10 departaments i emmagatzema'ls en la matriu associativa.
    Comença pel department_id 10. Augmentav_deptno en 10 per a cada interacció de bucle. La següent
    taula mostra els valors department_id per als que cal recuperar department_name.
  */
    FOR i IN 1..f_loop_count
    LOOP
        v_deptno:=v_deptno+10;
        select department_name
        into my_dept_table(i)
        from departments
        where department_id = v_deptno;

    END LOOP;


    -- Si utiliza otro bucle, puede recuperar los nombres de los departamentos de la matriz asociativa y mostrarlos.
    FOR i IN 1..f_loop_count
    LOOP
        dbms_output.put_line(my_dept_table(i));
    END LOOP;
end;
/