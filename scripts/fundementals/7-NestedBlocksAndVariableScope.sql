declare
  v_test pls_integer := 1;
begin  
  dbms_output.put_line('First nested block');
  declare
    v_test2 pls_integer := 2;
  begin
    dbms_output.put_line( v_test + v_test2);
  end;
  /*
  declare
    v_test3 pls_integer := 3;
  begin
    dbms_output.put_line( v_test3 + v_test2);
  end;
  */
  dbms_output.put_line('Second nested block');
  declare
    v_test pls_integer := 4;
  begin
    dbms_output.put_line(v_test);
  end;  
  
end;  
