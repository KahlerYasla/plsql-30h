declare

  test pls_integer;
  /* Wrong declaration starts with number */
  --1asd pls_integer;

  o$zzy# pls_integer;

  a123456789a123456789a123456789 pls_integer;

  /*
  reserve words not supported
  https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/reservewords.htm
  */
  --like pls_integer;

  --constant, must be initialize
  --test2 constant pls_integer;

  test3 constant pls_integer := 1; 
  "test4" constant pls_integer := 1; 
  
  v_test4	varchar2(15) := 'Father''s day';
  v_test5	VARCHAR2(15):= q'!Father's day!';

begin
  test := 1;
  --cant assign
  --test3 := test;
  dbms_output.put_line(v_test4); 
  dbms_output.put_line(v_test5);  
end;
