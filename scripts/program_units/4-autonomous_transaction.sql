--drop table tmp_ozan 
--create table tmp_ozan (test varchar2(100));
create or replace procedure insert_tmp_ozan is
  pragma autonomous_transaction;
  v_cnt pls_integer;
begin
  select count(*) into v_cnt from tmp_ozan;
  dbms_output.put_line(v_cnt);
  insert into tmp_ozan (test) values ('1');
    practicelib.sayhi;
  commit;
end;


declare
begin
  practicelib.sayhi;
  insert into tmp_ozan (test) values ('0');
  insert_tmp_ozan;
end;

