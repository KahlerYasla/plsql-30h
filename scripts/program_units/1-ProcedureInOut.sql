declare
  v_emp_name employees.last_name%type;
  v_emp_sal  employees.salary%type;

  procedure query_emp(p_id     in employees.employee_id%type,
                      p_name   out employees.last_name%type,
                      p_salary in out employees.salary%type) is
  begin
    dbms_output.put_line('Inside name : ' || p_name || ' salary ' || p_salary);
    select last_name
          ,salary + nvl(p_salary, 0)
      into p_name
          ,p_salary
      from employees
     where employee_id = p_id;
  end query_emp;

begin
  v_emp_name := 1;
  v_emp_sal  := 100;
  query_emp(171, v_emp_name, v_emp_sal);
  dbms_output.put_line(v_emp_name || ' earns ' || to_char(v_emp_sal, '$999,999.00'));

end;
