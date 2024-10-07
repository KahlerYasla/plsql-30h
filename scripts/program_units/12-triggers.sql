create table tmp_ozan (test varchar2(100));

create or replace trigger trg_ozan_before
  before insert or update or delete on tmp_ozan
  for each row
declare    
  v_cnt  pls_integer;
begin
  dbms_output.put_line('Before');
  if updating then
    dbms_output.put_line('Old value:'||:old.a||' New value:'||:new.a); 
  end if;  
  
--  select count(*) into v_cnt from tmp_ozan where a = 10;
  dbms_output.put_line(v_cnt); 

end;
/


create or replace trigger trg_ozan_after
  after insert or update or delete on tmp_ozan
  for each row

declare
  v_cnt pls_integer;
begin
  dbms_output.put_line('After');
  if updating then
    dbms_output.put_line('Old value:' || :old.a || ' New value:' || :new.a);
  end if;
 
 -- select count(*) into v_cnt from tmp_ozan where a = 10;
  dbms_output.put_line(v_cnt);
end;

--instead of out of scope

create or replace trigger trg_ozan_compound
  for update on tmp_ozan
  compound trigger

  v_cnt pls_integer;

  before statement is
  
  begin
    dbms_output.put_line('compound before statement');
    select count(*) into v_cnt from tmp_ozan where a = 10;
    dbms_output.put_line(v_cnt);
  end before statement;

  before each row is
  begin
    dbms_output.put_line('compound before each');
   -- select count(*) into v_cnt from tmp_ozan where a = 10;
    dbms_output.put_line(v_cnt);    
  end before each row;

  after each row is
  begin
    dbms_output.put_line('compound after each');
   -- select count(*) into v_cnt from tmp_ozan where a = 10;
    dbms_output.put_line(v_cnt);    
  end after each row;

  after statement is
  begin
    dbms_output.put_line('compound after statement');
    select count(*) into v_cnt from tmp_ozan where a = 10;
    dbms_output.put_line(v_cnt);    
  end after statement;

end;




update tmp_ozan set a = 10 where rownum < 2;


