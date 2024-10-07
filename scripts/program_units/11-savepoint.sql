/*drop table tmp_ozan;
create table tmp_ozan(a number(22));*/

declare
begin
  savepoint sp_first;
  
  insert into tmp_ozan (a) values (1);
  
  begin
    savepoint sp_second;
    insert into tmp_ozan (a) values (2);   
    dbms_output.put_line(1/0);
  exception
    when others then
      rollback to sp_second;
  end;
/*  commit;
  rollback to sp_first;  */
end;  

--select * from tmp_ozan
