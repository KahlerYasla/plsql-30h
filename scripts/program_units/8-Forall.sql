CREATE TABLE parts1 (pnum INTEGER, pname VARCHAR2(15));
CREATE TABLE parts2 (pnum INTEGER, pname VARCHAR2(15));
declare
  type numtab is table of parts1.pnum%type index by pls_integer;
  type nametab is table of parts1.pname%type index by pls_integer;
  pnums  numtab;
  pnames nametab;
  iterations constant pls_integer := 60000;
  t1 integer;  t2 integer;  t3 integer;
begin
  
  for j in 1..iterations loop  -- load index-by tables
     pnums(j) := j;
     pnames(j) := 'Part No. ' || to_char(j);
  end loop;
  
  t1 := dbms_utility.get_time;
  
  for i in 1..iterations loop  -- use for loop
     insert into parts1 values (pnums(i), pnames(i));
  end loop;
  
  t2 := dbms_utility.get_time;
  
  forall i in 1..iterations  -- use forall statement
     insert into parts2 values (pnums(i), pnames(i));
     
  t3 := dbms_utility.get_time;
  
  dbms_output.put_line('Execution Time (secs)');
  dbms_output.put_line('---------------------');
  dbms_output.put_line('FOR loop: ' || to_char((t2 - t1)/100));
  dbms_output.put_line('FORALL:   ' || to_char((t3 - t2)/100));
  commit;
end;
/
DROP TABLE parts1;
DROP TABLE parts2;
