declare
  v_myage   number := 10;
  v_yourage number;
  v_dummy   char(1) := 'X';
  v_test    pls_integer;
begin

  if v_myage < 11 then
    dbms_output.put_line(' I am a child ');
  elsif v_myage < 20 then
    dbms_output.put_line(' I am young ');
  elsif v_myage < 30 then
    dbms_output.put_line(' I am in my twenties');
  elsif v_myage < 40 then
    dbms_output.put_line(' I am in my thirties');
  else
    dbms_output.put_line(' I am always young ');
  end if;

  if v_yourage < 11 then
    dbms_output.put_line(' You are a child ');
  elsif v_yourage < 20 then
    dbms_output.put_line(' You are young ');
  elsif v_yourage < 30 then
    dbms_output.put_line(' You are in your twenties');
  elsif v_yourage < 40 then
    dbms_output.put_line(' You are in your thirties');
  else
    dbms_output.put_line(' You are always young ');
  end if;


  
  v_test := case
              when v_dummy = 'X' then
               0
              else
               1
            end;
  dbms_output.put_line(v_test);
end;

/*

select decode(dummy,'X',0,'Y', 1) from dual;

select case
         when dummy = 'X' then
          0
         when dummy = 'Y' then
          2
         else
          1
       end
  from dual;

select *
  from dual
 where (case
         when dummy = 'X' then
          0
         when dummy = 'Y' and dummy = 'X' then
          2
         else
          1
       end) = 0

*/
