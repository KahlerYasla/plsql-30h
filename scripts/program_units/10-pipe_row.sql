create or replace type string_list as table of varchar2(4000)
/


create or replace function GetEmployeeNames return string_list
  pipelined as

begin

  for r in (select * from employees) loop
  
    pipe row(r.first_name);
  
  end loop;

end;


select column_value first_name from table(GetEmployeeNames);
