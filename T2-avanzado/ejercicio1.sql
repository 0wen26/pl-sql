/*
    1) Crea i crida a la funció GET_JOB per retornar un càrrec.
        a) Crea i compila la funció anomenada GET_JOB per retornar
        un càrrec (job_title) a partir del identificador (job_id).
*/

create or replace function GET_JOB ()

begin
  select job_title into v_job_title
    from jobs
   where job_id = p_job_id;
   return v_title;

end;