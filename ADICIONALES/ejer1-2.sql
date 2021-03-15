/*
    Crea la funció Total_Salari_Dept2 per tal que en cas 
    de que no existeixi el número de departament utilitzi 
    el procediment RAISE_APPLICATION_ERROR per generar una 
    excepció amb el codi:
     -20215 i missatge: 'No existeix aquest departament!!'.
*/


CREATE or replace FUNCTION total_salari_dept2 (p_deptno number) RETURN number IS
    v_total_sal_dept number :=0;
    v_job employees.job_id%type;
    v_sal number:=0;
CURSOR c_emp_cursor IS
    select job_id,salary
    from employees
    where department_id = p_deptno;
e_insert_excep EXCEPTION;
PRAGMA EXCEPTION_INIT (e_insert_excep,-20215 );

begin
    open c_emp_cursor;
    -- FOR emp_record IN c_emp_cursor
    fetch c_emp_cursor into emp_record;
   -- exit when c_emp_cursor%notfound;
        loop
            if emp_record.job_id = 'AD_ASST' OR emp_record.job_id ='SA_REP' 
                OR emp_record.job_id = 'SH_CLERK' OR emp_record.job_id = 'PU_CLERK'
                OR emp_record.job_id = 'ST_CLERK' then
                v_sal := emp_record.SALARY*0.03+emp_record.salary;
                v_total_sal_dept:=v_sal +v_total_sal_dept;

            elsif emp_record.job_id = 'AC_ACCOUNT' OR emp_record.job_id ='FI_ACCOUNT' 
                OR emp_record.job_id = 'HR_REP' OR emp_record.job_id = 'PR_REP'
                OR emp_record.job_id = 'IT_PROG' OR emp_record.job_id = 'MK_REP' then
                
                v_sal := emp_record.SALARY*0.03+emp_record.salary;
                v_total_sal_dept:=(v_total_sal_dept*0.05)+v_total_sal_dept;
            
            elsif emp_record.job_id = 'MK_MAN' OR emp_record.job_id ='AC_MGR' 
                OR emp_record.job_id = 'FI_MGR' OR emp_record.job_id = 'PU_MAN'
                OR emp_record.job_id = 'SA_MAN' OR emp_record.job_id = 'ST_MANAGER' then
                
                v_sal := emp_record.SALARY*0.03+emp_record.salary;
                v_total_sal_dept:=(v_total_sal_dept*0.07)+v_total_sal_dept;
            
            elsif emp_record.job_id = 'AD_PRES' OR emp_record.job_id ='AD_VP' then

                v_sal := emp_record.SALARY*0.03+emp_record.salary;
                v_total_sal_dept:=(v_total_sal_dept*0.09)+v_total_sal_dept;

            end if;
        end loop;

    close c_emp_cursor;

        return v_total_sal_dept;
    exception
      when  e_insert_excep then
        dbms_output.put_line('Error');

end;