/*
    1.- Crea la taula TEMPS en la base de dades atenent a l'esquema relacional anterior; considerant l'atribut data
    com a clau principal. La resta dels atributs no admeten valors nuls
*/
create TABLE TEMPS (
    data date,
    dia number(2) NOT NULL,
    dia_setmana varchar2(30) NOT NULL,
    mes varchar2(30) NOT NULL,
    trimestre varchar2(10) NOT NULL,
    any number(5) NOT NULL,
    primary key (data)    
);

/*
    2.- Crea una funció PL/SQL que donat un nombre enter obtingui en format text el corresponent mes.
    Per exemple:
    EXECUTE convertir_mes(1) → Gener
*/

create or replace FUNCTION convertir_mes( v_num_mes number)
return VARCHAR2 IS
v_letras_mes varchar2(15);
  
begin
  if v_num_mes = 1 then
        v_letras_mes := 'Enero';
        return v_letras_mes;
    elsif v_num_mes = 2 then
        v_letras_mes := 'Febrero';
        return v_letras_mes;
    elsif v_num_mes = 3 then
        v_letras_mes := 'Marzo';
        return v_letras_mes ;
    elsif v_num_mes = 4 then
        v_letras_mes := 'Abril';
        return v_letras_mes;
     elsif v_num_mes = 5 then
        v_letras_mes := 'Mayo';
        return v_letras_mes;
    elsif v_num_mes = 6 then
        v_letras_mes := 'Junio';
        return v_letras_mes ;
    elsif v_num_mes = 7 then
        v_letras_mes := 'Julio';
        return v_letras_mes ;
     elsif v_num_mes = 8 then
        v_letras_mes := 'Agosto';
        return v_letras_mes;
    elsif v_num_mes = 9 then
        v_letras_mes := 'Septiembre';
        return v_letras_mes;
    elsif v_num_mes = 10 then
        v_letras_mes := 'Octubre';
        return v_letras_mes ;    
    elsif v_num_mes = 11 then
        v_letras_mes := 'Noviembre';
        return v_letras_mes ;
    elsif v_num_mes = 12 then
         v_letras_mes := 'Diciembre';
        return v_letras_mes; 
  else
    v_letras_mes := 'Indique un mes valido';
    return v_letras_mes;
  end if;
end;
/

EXECUTE dbms_output.PUT_LINE(convertir_mes(10));

/*
    3.- Crea un procediment emmagatzemat PL/SQL que rebi com a paràmetres un rang de dates i afegeixi en la
    taula TEMPS un registre per cada dia comprès entre aquestes dates. Per exemple:
    EXECUTE afegir_temps('01/01/2019', '10/01/2019');
    Per realitzar el procediment sol·licitat en el punt 3, has d'emprar la següent funció, que a partir d'una data et
    retorna el dia següent a aquesta data.

*/

create or replace procedure afegir_temps (
    
)