/*
   a)  Fes un bloc PL/SQL per omplir una taula de registres indexada per VARCHAR2,
     que crei una taula indexada per job_id i crea un cursor que recuperi tots els empleats ordenats
      per departament i recorre'l per omplir la taula amb la següent informació: 
     número d'empleats que tenen aquest ofici i el número de departaments que tenen aquest ofici.
     Mostra el resultat

     En un bloc PL/SQL declara una taula de registres per recollir el job_title, quants departaments
      tenen aquest ofici i quants empleats tenen aquest ofici. La taula estarà indexada per VARCHAR2 (job_id). 
      Declara també les variables respectives.
*/


set serveroutput on;
Declare

    type t_job IS RECORD
    (
        job_title jobs.job_title%type,
        num_depts number(2),
        num_emps number(2)
    );

    v_job t_job;

    type job_table_type is table of t_job iNDEX BY VARCHAR2(10);

    job_table job_table_type;

/*
    b) Mitjançant un cursor recupera el job_id i job_title de la taula
     JOBS i inicialitza les dades de la taula de 
    l'apartat a) convenientment (numdepts = 0, num_emps=0). 
    Mostra el resultat.
*/
    CURSOR c_job_cursor IS 
        select job_id,job_title
        from JOBS;
    v_job_id jobs.job_id%type;
/*
c) Utilitzant un cursor que recuperi tots els departaments amb els seus
 oficis i el número de treballadors que fan cada ofici, i actualitza
  la taula convenientment. Mostra el resultat.
*/
    cursor c_ofice_cursor IS
        SELECT DEPARTMENT_ID,

    
begin
  for v_job_record in c_job_cursor  loop

      v_job.job_title := v_job_record.job_title;
      v_job.num_depts:=0;
      v_job.num_emps:=0;
      job_table (v_job_record.job_id):=v_job;   
  end loop;

  v_job_id:=job_table.FIRST;
  WHILE v_job_id IS NOT NULL loop
      dbms_output.put_line(job_table(v_job_id).job_title);
      v_job_id:= job_table.NEXT(v_job_id);
  end loop;



end;