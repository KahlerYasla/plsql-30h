declare
  v_test pls_integer := 0;
begin
  
  loop
    v_test := v_test + 1;
    dbms_output.put_line('Basic Loop ' || v_test);
    exit when v_test = 10;
  end loop;
  v_test := 0;
  
--  return;
  
  dbms_output.put_line('---------------------------');
  
  while v_test < 10 loop
    v_test := v_test + 1;
    dbms_output.put_line('While Loop ' || v_test);
  end loop;
  
  dbms_output.put_line('---------------------------');
  
  for v_test2 in 1 .. 10 loop    
    dbms_output.put_line('For Loop ' || v_test2);
  end loop;
  
  dbms_output.put_line('---------------------------');
  
  for i in reverse 1 .. 10 loop
    dbms_output.put_line('For Reverse Loop ' || i);
  end loop;
  
  dbms_output.put_line('---------------------------');

  for i in 1 .. 10 loop
    if i = 3 then
      continue;
    end if;
    dbms_output.put_line('For Continue Loop ' || i);
  end loop;
  
  dbms_output.put_line('---------------------------');
  
  for i in 1 .. 10 loop
    if i = 5 then
      exit;
    end if;
    dbms_output.put_line('For Exit Loop ' || i);
  end loop;

end;
