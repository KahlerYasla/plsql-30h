declare
  v_lname varchar2(15);
begin
  begin
    select last_name into v_lname from employees where first_name = 'John';
    dbms_output.put_line('John''s last name is :' || v_lname);
  exception
    when no_data_found then
      dbms_output.put_line('no data found');
    when too_many_rows then
      dbms_output.put_line('too many rows');
  end;
  dbms_output.put_line(1/0);
  declare
    e_null exception;
    pragma exception_init(e_null, -01400);
  begin
    --   raise excep_null;
    insert into departments
      (department_id
      ,department_name)
    values
      (280
      ,null);
  exception
    when e_null then
      dbms_output.put_line('null exception');
      -- dbms_output.put_line(sqlcode || ':' || sqlerrm);
  end;
  raise_application_error(-20202, 'Kiss me baby one more time.');
exception
  when others then
    dbms_output.put_line(dbms_utility.format_call_stack);
    dbms_output.put_line('-------------------------------');
    dbms_output.put_line(dbms_utility.format_error_backtrace);
    raise_application_error(-20202, 'Test: ' || sqlerrm);
end;
