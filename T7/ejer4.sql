--desc employees;



BEGIN
    FOR v_lastname_record IN (
        SELECT last_name,hire_date
        FROM employees
        order by last_name asc)

    LOOP
        dbms_output.put_line(v_lastname_record.last_name );

    END LOOP;


END;
/
