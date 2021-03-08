

DECLARE

    --Declaro variable
    v_deptno number:=20;
    
    --declaro cursor
    CURSOR c_emp IS

    select LAST_NAME,SALARY,manager_id
      from EMPLOYEES
     where department_id = v_deptno;
    --v_cursor c_emp%ROWTYPE;
begin

  for emp_record IN c_emp
  LOOP
     if emp_record.salary < 5000 and (emp_record.manager_id =101 or emp_record.manager_id= 124)  then
        dbms_output.put_line(v_deptno || ' ' || emp_record.LAST_NAME || ' Due for a raise');  
        
      else
        dbms_output.put_line(v_deptno || ' ' || emp_record.LAST_NAME || ' Not due for a raise');
        
      end if;
  end loop;

END;
/