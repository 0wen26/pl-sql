
DECLARE

    --Declaro variable
    v_deptno number:=80;
    
    --declaro cursor
    CURSOR c_emp IS

    select LAST_NAME,SALARY,manager_id
      from EMPLOYEES
     where department_id = v_deptno;
    v_cursor c_emp%ROWTYPE;
begin
    open c_emp;

    loop
      fetch c_emp into v_cursor;      
      exit when c_emp%NOTFOUND;
      if v_cursor.salary < 5000 and (v_cursor.manager_id =101 or v_cursor.manager_id= 124)  then
        dbms_output.put_line(v_deptno || ' ' || v_cursor.LAST_NAME || ' Due for a raise');  
        
      else
        dbms_output.put_line(v_deptno || ' ' || v_cursor.LAST_NAME || ' Not due for a raise');
        
      end if;
      
    end loop;
    close c_emp;


END;
/