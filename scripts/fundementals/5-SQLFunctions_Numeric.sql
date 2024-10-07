declare
begin
  --NUMERIC/MATH FUNCTIONS
  dbms_output.put_line('----------NUMERIC/MATH FUNCTIONS----------');

  dbms_output.put_line('-----ABS START-----');
  dbms_output.put_line(abs(-2));  
  dbms_output.put_line('-----ABS END-----');

  dbms_output.put_line('-----ROUND START-----');
  dbms_output.put_line(round(0.123));  
  dbms_output.put_line(round(0.123,2));  
  dbms_output.put_line(round(0.125,2));    
  dbms_output.put_line('-----ROUND END-----');

  dbms_output.put_line('-----TRUNC START-----');
  dbms_output.put_line(trunc(0.123));  
  dbms_output.put_line(trunc(0.123,1));  
  dbms_output.put_line(trunc(0.125,2));    
  dbms_output.put_line('-----TRUNC END-----');  
  
  dbms_output.put_line('-----FLOOR START-----');
  dbms_output.put_line(floor(1.523));  
  dbms_output.put_line('-----FLOOR END-----');

  dbms_output.put_line('-----CEIL START-----');
  dbms_output.put_line(ceil(0.123));  
  dbms_output.put_line('-----CEIL END-----');

  dbms_output.put_line('-----GREATEST/LEAST START-----');
  dbms_output.put_line(greatest(0,1));  
  dbms_output.put_line(least(0,1));    
  dbms_output.put_line('-----GREATEST/LEAST END-----');

  dbms_output.put_line('-----MOD START-----');
  dbms_output.put_line(mod(13,3));  
  dbms_output.put_line('-----MOD END-----');  
  
    
end;
