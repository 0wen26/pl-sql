set serveroutput on;
/*
     Fes un bloc PL/SQL anònim per provar la funció.
     Mostra el total dels salaris revisats dels departaments 10, 50 i 75.
*/

BEGIN
    dbms_output.put_line(total_salari_dept2(5));
    
    --dbms_output.put_line(total_salari_dept2(5));
end;
