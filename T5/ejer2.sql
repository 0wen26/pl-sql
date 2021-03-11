/*
CREATE TABLE employees2
AS
SELECT *
FROM employees;
ALTER TABLE employees2
ADD (stars VARCHAR2(50));
*/

DECLARE
    /*
    En la secció de declaracions del bloc, declara una variable v_empno del tipus
    employees2.employee_id e inicialitza-la en 176. Declara una variable v_asterisk
    del tipus emp.stars e inicialitza-la en NULL.
    Crea una variable v_sal del tipus emp.salary.
    */
    v_empno employees2.employee_id%type:=176;
    v_asterisk employees2.stars%type:= NULL;
    v_sal employees2.salary%type;
BEGIN
    /*
        En la secció executable, escriu lògica per afegir un asterisc (*) a la cadena per 
        cada 1000 dòlars del salari. Per exemple, si l'empleat guanya 8000 dòlars,
        la cadena d'asteriscs ha d'incloure vuit asteriscs.
        Si l'empleat guanya 12500 dòlars, la cadena d'asteriscs ha d'incloure 13 asteriscs.
    */
        select NVL(ROUND(salary/1000),0)
          into v_sal
          from employees2
         where employee_id = 176;

        FOR i IN 1..v_sal LOOP
            v_asterisk := v_asterisk ||'*';
        END LOOP;
        
    /*
        Actualitza la columna stars per a l'empleat amb la cadena d'asteriscs.
        Confirma abans del final del bloc.
    */
        update employees2
           set stars=v_asterisk
         where employee_id=v_empno;
END;
/
/*
     Mostra la fila de la taula emp per verificar que el bloc PL/SQL s'ha executat correctament.
*/

select *
from employees2
where employee_id =176;
 