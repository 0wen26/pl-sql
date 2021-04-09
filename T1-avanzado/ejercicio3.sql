create or replace procedure del_job (
    p_job_title jobs.job_title%type
) IS
begin
    delete from JOBS
     where JOB_TITLE = p_job_title;
     if SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20202,'error');
    end if;
end;

begin
  del_job('IT_DBA');
end;

begin
  del_job('IT_DBA');
end;
