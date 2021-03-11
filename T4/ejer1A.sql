CREATE TABLE TEMP(
NUM_STORE NUMBER(7,2),
CHAR_STORE VARCHAR2(35),
DATE_STORE DATE);

DECLARE
    --Declara dues variables i assigna el següents valors a aquestes variables:
    v_message varchar2(35):='This is my first PL/SQL program';
    v_date_written date :=sysdate();

BEGIN
    --Emmagatzema els valors d'aquestes variables en les columnes adients de la tabla TEMP.
    insert into temp (char_store,date_store)
    values (v_message,v_date_written);
END;
/
--Verifica els resultats consultant la taula TEMP. La sortida resultant ha de ser com la següent:
select * from temp;