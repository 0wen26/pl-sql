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

CREATE or replace FUNCTION total_salari_dept (p_deptno departments.department_id%type) RETURN number IS
CURSOR c_emp_cursor IS
    select job_id,salary
    from employees
    where department_id = p_deptno;
v_total_sal_dept number(8,2) :=0;
v_sal number(8,2):=0;

begin
     FOR emp_record IN c_emp_cursor
    loop
        if emp_record.job_id IN ('AD_ASST','SA_REP','SH_CLERK','PU_CLERK','ST_CLERK') then

            v_sal := emp_record.SALARY*0.03+emp_record.salary;
            v_total_sal_dept:=v_sal +v_total_sal_dept;

        elsif emp_record.job_id IN('AC_ACCOUNT','FI_ACCOUNT','HR_REP','PR_REP','IT_PROG','MK_REP') then
            
            v_sal := emp_record.SALARY*0.03+emp_record.salary;
            v_total_sal_dept:=(v_total_sal_dept*0.05)+v_total_sal_dept;
        
        elsif emp_record.job_id IN('MK_MAN','AC_MGR','FI_MGR','PU_MAN','SA_MAN','ST_MANAGER') then
            
            v_sal := emp_record.SALARY*0.03+emp_record.salary;
            v_total_sal_dept:=(v_total_sal_dept*0.07)+v_total_sal_dept;
        
        elsif emp_record.job_id IN('AD_PRES','AD_VP') then

            v_sal := emp_record.SALARY*0.03+emp_record.salary;
            v_total_sal_dept:=(v_total_sal_dept*0.09)+v_total_sal_dept;

        end if;
    end loop;
        return v_total_sal_dept;
   

end;