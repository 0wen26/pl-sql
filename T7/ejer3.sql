
CREATE TABLE top_salaries(
    salary NUMBER(7,2));

desc EMPLOYEES;

declare

   v_num NUMBER:=5;
   v_emp_sal EMPLOYEES.salary%type;

   CURSOR c_emp_cursor IS
      SELECT DISTINCT SALARY
      FROM EMPLOYEES
      order by salary desc;
   v_emp_record c_emp_cursor%rowtype;
   
BEGIN
   open c_emp_cursor;
      LOOP
         fetch c_emp_cursor INTO v_emp_record;
         
         exit when c_emp_cursor%rowcount > v_num OR c_emp_cursor%notfound;
            insert into top_salaries (salary)
            values (v_sal);
            
      END LOOP;

   close c_emp_cursor;

END;
/
--drop table  top_salaries;


select * from top_salaries;