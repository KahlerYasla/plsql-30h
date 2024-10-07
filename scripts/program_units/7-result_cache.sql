create or replace function resultcache_test(p_emp_id number) return varchar result_cache relies_on(employees) is
  v_date_hired date;
begin
  dbms_output.put_line('Inside');
  select hire_date into v_date_hired from employees where employee_id = p_emp_id;
  return v_date_hired;
end;



select resultcache_test(employee_id) from employees;

begin
  DBMS_RESULT_CACHE.Flush;
end;
