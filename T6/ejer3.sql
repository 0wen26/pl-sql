set set serveroutput on;
DECLARE
    /*
        Has declarat que la matriu associativa sigui del tipus departments.department_name. Modifica la
        declaració de la matriu associativa per emmagatzemar temporalment el número, el nom i la ubicació de
        tots els departaments. Utilitza l'atribut %ROWTYPE.   
    */
    TYPE dept_table_type IS TABLE OF
        departments%rowtype
    index BY pls_integer;

    my_dept_table dept_table_type;
    
    --Declara dues variables: f_loop_count i v_deptno del tipus NUMBER.
    -- Assigna 10 a f_loop_count i 0 a v_deptno.
    f_loop_count number:=10;
    v_deptno number:=0;
    
begin
  
  /*
    Modifica la sentència SELECT per recuperar tota la informació del departament que està en la taula
    departments i emmagatzemar-la en la matriu associativa.
  */
    FOR i IN 1..f_loop_count
    LOOP
        v_deptno:=v_deptno+10;
        select *
        into my_dept_table(i)
        from departments
        where department_id = v_deptno;

    END LOOP;


    /*
    Si utilitzes un altre bucle, pots recuperar la informació dels departaments
     de la matriu associativa i mostrar-la.
    */
    FOR i IN 1..f_loop_count
    LOOP
        dbms_output.put_line(
            'Department number: ' || my_dept_table(i).department_id ||
            ' Department name: '  || my_dept_table(i).department_name || 
            ' Manager Id: ' || my_dept_table(i).manager_id ||
            ' Location Id: ' || my_dept_table(i).location_id);
    END LOOP;
end;
/