create or replace procedure ADD_JOB(
    p_jobId jobs.job_id%type,
    p_job_title jobs.job_title%type
) IS

begin
  insert into jobs (job_id,job_title)
  values (p_jobId,p_job_title);
end;


BEGIN
ADD_JOB('IT_DBA','Database Administrator');
end;

BEGIN
ADD_JOB('ST_MAN','Stock Manager');
end;