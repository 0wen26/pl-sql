DROP table messages;

CREATE TABLE messages(
results VARCHAR2(100));
DECLARE

    v_count NUMBER:=1;

BEGIN
    --Afegeix el números del 1 al 10, excloent el 6 i el 8. con loop
    
    LOOP
        IF v_count = 6 or v_count = 8 THEN
            v_count:=v_count+1;
        ELSE
            insert into messages(results)
            values(v_count);
            v_count:=v_count+1;
        end IF;
        exit when v_count=11;
    END LOOP;
    
    --Afegeix el números del 1 al 10, excloent el 6 i el 8. con for
    /*
    for i in 1..10 LOOP
        IF (i < 6 or i = 7 or i > 8) THEN
             insert into messages(results)
            values(i);           
        end IF;
    end loop;
    
    --Afegeix el números del 1 al 10, excloent el 6 i el 8. con for
    
    WHILE v_count < 11 LOOP
        IF v_count = 6 or v_count = 8 THEN
            v_count:=v_count+1;
        ELSE
            insert into messages(results)
            values(v_count);
            v_count:=v_count+1;
        end if;

    end loop;
    */
END;
/

--Executa la sentència SELECT per verificar que el bloc PL/SQL ha funcionat
select * from messages;