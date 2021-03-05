    set SERVEROUTPUT ON;
declare
    --Declaro cursor para recuperar department_id  menores de 100
    CURSOR c_dept_cursor IS
    select department_id, department_name
      from departments
     where department_id < 100
     order by department_id;
    --Declaro cursor al que paso un parametro y compruevo que sea menor de 120 el employee id
    -- del departamento que paso como parametro
    CURSOR c_emp_cursor  (deptno number) IS
    select last_name,job_id,hire_date, salary
      from employees
     where department_id = deptno  and employee_id < 120;
     --Variables
     v_emp departments.department_id%type;
     v_dept departments.department_name%type;
     v_emp_record c_emp_cursor%rowtype;

begin

    open c_dept_cursor;
        LOOP
            fetch c_dept_cursor into v_emp,v_dept;
            exit when c_dept_cursor%notfound;
            dbms_output.put_line('Department number: '|| v_emp ||
                                 ' Department name: ' || v_dept);
               if not c_emp_cursor%ISOPEN THEN     
                  open c_emp_cursor(v_emp);
               end if;          
                  LOOP
                     fetch c_emp_cursor INTO v_emp_record;
                     exit when c_emp_cursor%notfound;
                     dbms_output.put_line(v_emp_record.last_name || '     ' ||
                     v_emp_record.job_id || '   ' || v_emp_record.hire_date
                     || '    '|| v_emp_record.salary);
                        
                  end loop;
                  dbms_output.put_line('--------------------------------------------------------------------');
               close c_emp_cursor;
                
        end loop;
        
    close c_dept_cursor;
end;