begin
/*
    Inicia el bloc executable amb la paraula clau BEGIN. Inclou la sentència UPDATE per definir
    location_id en 3000 per al nou departament.

*/
update departments
   set location_id = 3000
 where department_id = 280;

end;
/
/*
    Acaba el bloc executable en la paraula clau END. Acaba el bloc PL/SQL amb "/" e inclou una
    sentència SELECT per mostrar el departament que ha actualitzat.
*/
select *
  from departments;
/*
Inclou una sentència DELETE per suprimir el departament agregat.
*/
delete from departments
where department_id =280;