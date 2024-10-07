declare
begin
  --STRING/CHAR FUNCTIONS
  dbms_output.put_line('----------STRING/CHAR FUNCTIONS----------');
  --ASCII
  dbms_output.put_line('-----ASCII START-----');
  dbms_output.put_line(ASCII('A'));
  dbms_output.put_line(CHR(65));
  dbms_output.put_line('-----ASCII END-----');

  --CONCAT
  dbms_output.put_line('-----CONCAT START-----');
  dbms_output.put_line(concat('kiss', ' me'));
  dbms_output.put_line('kiss' || ' me');
  dbms_output.put_line('-----CONCAT END-----');

  --INSTR
  dbms_output.put_line('-----INSTR START-----');
  dbms_output.put_line(instr('ABCDEB', 'B'));--2
  dbms_output.put_line(instr('ABCDEB', 'B', 3));--6
  dbms_output.put_line(instr('ABCDEB', 'B', 1, 1));--2
  dbms_output.put_line(instr('ABCDEB', 'B', 1, 2));--6
  dbms_output.put_line('-----INSTR END-----');
  
-----

  --LENGTH
  dbms_output.put_line('-----LENGTH START-----');
  dbms_output.put_line(length('test'));
  dbms_output.put_line('-----LENGTH END-----');

  --LPAD,RPAD
  dbms_output.put_line('-----LPAD/RPAD START-----');
  dbms_output.put_line(lpad('test', 10, '0'));
  dbms_output.put_line(rpad('test', 10, '0'));
  dbms_output.put_line('-----LPAD/RPAD END-----');

  --UPPER/LOWER
  dbms_output.put_line('-----UPPER/LOWER START-----');
  dbms_output.put_line(upper('test'));
  dbms_output.put_line(initcap('test_test2'));
  dbms_output.put_line(lower('TEST'));
  dbms_output.put_line('-----UPPER/LOWER END-----');

  --LTRIM,RTRIM,TRIM
  dbms_output.put_line('-----LTRIM,RTRIM,TRIM START-----');
  dbms_output.put_line(ltrim(' test '));
  dbms_output.put_line(rtrim(' test '));
  dbms_output.put_line(trim(' test '));
  dbms_output.put_line('-----LTRIM,RTRIM,TRIM END-----');

  --SUBSTR
  dbms_output.put_line('-----SUBSTR START-----');
  dbms_output.put_line(substr('test', 1, 2));
  dbms_output.put_line(substr('test', -2, 2));
  dbms_output.put_line(substr('test', 2));
  dbms_output.put_line('-----SUBSTR END-----');

  --REPLACE,TRANSLATE
  dbms_output.put_line('-----REPLACE,TRANSLATE START-----');
  dbms_output.put_line(replace('OZAN DURLU', 'OZAN', 'ÖZGÜR'));
  dbms_output.put_line(translate('OZAN DURLU', 'AU', '12'));
  dbms_output.put_line('-----REPLACE,TRANSLATE END-----');

end;
