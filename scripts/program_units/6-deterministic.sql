create or replace function deterministic_test(p_job_id employees.job_id%type) return date is
v_return  date;
begin
  dbms_output.put_line('inside');
  select max(start_date)  into v_return from job_history where job_id = p_job_id;
  return v_return;
end;  



create or replace function deterministic_test(p_job_id employees.job_id%type) return date deterministic is
v_return  date;
begin
  dbms_output.put_line('inside');
  select max(start_date)  into v_return from job_history where job_id = p_job_id;
  return v_return;
end;  


select deterministic_test(job_id) , t.* from employees t;


