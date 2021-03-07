
CREATE TABLE top_salaries(
    salary NUMBER(7,2));

desc EMPLOYEES;
declare

   v_num NUMBER:=5;
   v_emp_sal EMPLOYEES.salary%type;

   CURSOR c_emp_cursor IS
      SELECT SALARY
      FROM EMPLOYEES
      order by salary desc;
   v_emp_record c_emp_cursor%rowtype;
   v_count number:=0;
BEGIN
   open c_emp_cursor;
      LOOP
         fetch c_emp_cursor INTO v_emp_record;
         
         exit when v_count=v_num;
            insert into top_salaries (salary)
            values (v_emp_record.SALARY);
            v_count:=v_count+1;
      END LOOP;



END;
/
--drop table  top_salaries;


select * from top_salaries;