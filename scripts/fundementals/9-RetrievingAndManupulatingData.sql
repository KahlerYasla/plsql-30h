--select * from employees

declare
  v_first_name employees.first_name%type;
  v_last_name  employees.last_name%type;

  r_emp employees%rowtype;
begin

  select * into r_emp from employees where employee_id = 198;
  r_emp.employee_id := employees_seq.nextval;
  insert into employees values r_emp;

  select first_name
        ,last_name
    into v_first_name
        ,v_last_name
    from employees
   where employee_id = 198;
  dbms_output.put_line('Before update ' || sql%rowcount || v_first_name || ';' || v_last_name);

  update employees set first_name = 'Ozzy' where employee_id = 198;
  select first_name
        ,last_name
    into v_first_name
        ,v_last_name
    from employees
   where employee_id = 198;
  dbms_output.put_line('After update ' || v_first_name || ';' || v_last_name);

  /*  insert into employees
      (employee_id
      ,first_name
      ,last_name
      ,email
      ,hire_date
      ,job_id
      ,salary)
    values
      (employees_seq.nextval
      ,'Ruth'
      ,'Cores'
      ,'RCORES'
      ,current_date
      ,'AD_ASST'
      ,4000);
  */
  delete employees
   where first_name = 'Ruth'
     and last_name = 'Cores';

  dbms_output.put_line(sql%rowcount);
  --rollback;
end;
/
