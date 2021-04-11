/*
    2.- Crea una funció PL/SQL que donat un nombre enter obtingui en format text el corresponent mes.
    Per exemple:
    EXECUTE convertir_mes(1) → Gener
*/

create or replace FUNCTION convertir_mes(
    v_num_mes number(10)
)
return VARCHAR2 IS
v_letras_mes varchar2(15);
  
begin
  if v_num_mes = 1 then
        return v_letras_mes := 'Enero';
    elsif v_num_mes = 2 then
        return v_letras_mes := 'Febrero';
    elsif v_num_mes = 3 then
        return v_letras_mes := 'Marzo';
    elsif v_num_mes = 4 then
        return v_letras_mes := 'Abril';
     elsif v_num_mes = 5 then
        return v_letras_mes := 'Mayo';
    elsif v_num_mes = 6 then
        return v_letras_mes := 'Junio';
    elsif v_num_mes = 7 then
        return v_letras_mes := 'Julio';
     elsif v_num_mes = 8 then
        return v_letras_mes := 'Agosto';
    elsif v_num_mes = 9 then
        return v_letras_mes := 'Septiembre';
    elsif v_num_mes = 10 then
        return v_letras_mes := 'Octubre';    
    elsif v_num_mes = 11 then
        return v_letras_mes := 'Noviembre';
    elsif v_num_mes = 12 then
        return v_letras_mes := 'Diciembre'; 
  else
    return v_letras_mes := 'Indique un mes valido';
  end if;
end;

EXECUTE convertir_mes(1);