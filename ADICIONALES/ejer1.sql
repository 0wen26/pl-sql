set serveroutput on;
/*
     Fes un bloc PL/SQL anònim per provar la funció.
     Mostra el total dels salaris revisats dels departaments 10, 50 i 75.
*/

BEGIN
<<<<<<< HEAD
    dbms_output.put_line(total_salari_dept2(5));
=======
    dbms_output.put_line(total_salari_dept2(10));
    dbms_output.put_line(total_salari_dept2(50));
    dbms_output.put_line(total_salari_dept2(75));
>>>>>>> 9b70c6338d78860149fdb689db0c694e2c7c62bf
    
    --dbms_output.put_line(total_salari_dept2(5));
end;
