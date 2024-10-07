declare
  v_date   date := trunc(sysdate);
  v_string varchar2(32767) := '26061983';
  v_number number(22, 6) := 1.2;
begin
  --CONVERSATION FUNCTIONS
  dbms_output.put_line('----------CONVERSATION FUNCTIONS----------');
  
  dbms_output.put_line('-----TO_CHAR START-----');
  dbms_output.put_line(to_char(v_number));
  dbms_output.put_line(to_char(v_number, '99.99'));
  dbms_output.put_line(to_char(v_number, '999.99', 'NLS_NUMERIC_CHARACTERS=''.,'''));
--  alter session set NLS_NUMERIC_CHARACTERS = ',.';
  dbms_output.put_line(to_char(v_date));  
  dbms_output.put_line(to_char(v_date, 'YYYMMDD'));    
  dbms_output.put_line('-----TO_CHAR END-----');

  dbms_output.put_line('-----TO_NUMBER START-----');
  dbms_output.put_line(to_number('1.2','9.9'));
  dbms_output.put_line('-----TO_NUMBER END-----');  

  dbms_output.put_line('-----TO_DATE START-----');
  dbms_output.put_line(to_date(v_string, 'DDMMYYYY'));
  dbms_output.put_line('-----TO_DATE END-----');  
    
end;
