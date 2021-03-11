set serveroutput on;
DECLARE
    --Declara una variable v_countryid. Assigna-li CA a v_countryid.
        v_countryid VARCHAR2(10):='CA';

    --b) En la secció de declaracions, utilitza l'atribut %ROWTYPE i declara la variable v_countryid_record del tipus countries.
        v_countryid_record countries%rowtype;

begin
    --En la secció executable, obté tota la informació de la taula countries mitjançant
    --v_countryid.Mostra la informació seleccionada sobre el país. la sortida 
    -- d'exemple és la següent:
        select *
          into v_countryid_record
          from countries
         where country_id = v_countryid;
    dbms_output.put_line('Country id: ' || v_countryid_record.country_id
                        || ' Country Name: ' || v_countryid_record.country_name);

end;
/