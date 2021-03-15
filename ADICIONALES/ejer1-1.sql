/*
    1.- Crea la taula PRESSUPOST (CREATE TABLE) que contingui els següent 
    camps: Nom_Department i Total_Salaris.

CREATE TABLE PRESSUPOST(
Nom_Department VARCHAR2(30) PRIMARY KEY, 
Total_Salaris NUMBER(8,2));
*/
/*
    Crea la funció Total_Salari_Dept que a partir d'un número de
    departament ens retorni el total de salaris pressupostats 
    per a aquell departament, tenint en compte els següents augments:

    4532 3%: AD_ASST, SA_REP, SH_CLERK, PU_CLERK, ST_CLERK
    5%: AC_ACCOUNT, FI_ACCOUNT, HR_REP, PR_REP, IT_PROG, MK_REP
    7%: MK_MAN, AC_MGR, FI_MGR, PU_MAN, SA_MAN, ST_MANAGER
    9%: AD_PRES, AD_VP 

    dep 50 125600
*/

CREATE or replace FUNCTION total_salari_dept (p_deptno number) RETURN number IS
    v_total_sal_dept number :=0;
    v_job employees.job_id%type;
    v_sal number:=0;
CURSOR c_emp_cursor IS
    select job_id,salary
    from employees
    where department_id = p_deptno;

begin
     FOR emp_record IN c_emp_cursor
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
        return v_total_sal_dept;
   

end;