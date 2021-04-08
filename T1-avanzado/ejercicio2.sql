create or replace PROCEDURE UPD_JOB (
     p_jobId jobs.job_id%type,
     p_job_title jobs.job_title%type
    ) IS
e_no_rows exception;
begin
  update jobs
     set job_title=p_job_title
   where job_id = p_jobId;
   if SQL%NOTFOUND THEN
        raise e_no_rows;
    end if;
    
exception
  when e_no_rows then
    dbms_output.put_line('no se ha podido actualizar');
end;

BEGIN
UPD_JOB('IT_DBA','Data Administrator');

end;

BEGIN

UPD_JOB('IT_WEB','Master');

end;

select * from jobs;

