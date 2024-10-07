create or replace function InitializeTest(p_where varchar2) return number is
begin
  dbms_output.put_line('InitializeTest : '||p_where);
  return 1;
end;
