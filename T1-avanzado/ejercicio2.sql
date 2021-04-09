create or replace PROCEDURE UPD_JOB (
     p_jobId jobs.job_id%type,
    p_job_title jobs.job_title%type
) IS

begin
  update jobs
     set job_title=p_job_title
   where job_id = p_jobId;
   if SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20202,'error');
    end if;
end;

BEGIN
UPD_JOB('IT_DBA','Data Administrator');

end;
BEGIN

UPD_JOB('IT_WEB','Master');

end;

select * from jobs;


