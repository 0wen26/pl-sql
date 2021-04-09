create or replace procedure del_job (
    p_job_id jobs.job_id%type
) IS
begin
    delete from JOBS
     where JOB_ID = p_job_id;
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
