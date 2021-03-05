/*
CREATE TABLE top_salaries(
    salary NUMBER(7,2));
*/
desc EMPLOYEES;
declare

   v_num NUMBER:=5;
   v_emp_sal EMPLOYEES.salary%type;

   CURSOR c_emp_cursor IS
      SELECT SALARY
      FROM EMPLOYEES
      order by salary desc;
BEGIN
   open c_emp_cursor;
      LOOP
         


      END LOOP;



END;
/