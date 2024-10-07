create or replace function tax(p_value in number) return number is
begin
  return(p_value * 0.08);
end tax;
/
select employee_id
      ,last_name
      ,salary
      ,tax(salary)
  from employees
 where department_id = 100;


create or replace function dml_call_sql(p_sal number) return number is
begin
  insert into employees
    (employee_id
    ,last_name
    ,email
    ,hire_date
    ,job_id
    ,salary)
  values
    (1
    ,'Frost'
    ,'jfrost@company.com'
    ,sysdate
    ,'SA_MAN'
    ,p_sal);
  return(p_sal + 100);
end;


update employees set salary = dml_call_sql(2000) where employee_id = 170;



