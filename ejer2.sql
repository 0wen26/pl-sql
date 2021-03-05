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
     v_emp employees.department_id%type;
     v_dept departments.department_id%type;

begin
    open c_dept_cursor;
        LOOP
        
    close c_dept_cursor;

    

    open c_emp_cursor(10);

    close c_emp_cursor;




end;