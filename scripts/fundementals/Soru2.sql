/*10 elementli collactionın loop kullanmadan yer değiştir.*/
declare
  type NumberList is table of pls_integer;-- index by pls_integer;
  nlist NumberList := NumberList(1,2,3,4,5,6,7,8,9,10);
  v_first pls_integer := 1;
  v_last pls_integer := 10;
  
begin
  dbms_output.put_line('BEFORE--------------------------');
  for i in nlist.first..nlist.last loop
    dbms_output.put_line(i || ':' || nlist(i));
  end loop;  
  
  dbms_output.put_line('AFTER--------------------------');
  for i in nlist.first..nlist.last loop
    dbms_output.put_line(i || ':' || nlist(i));
  end loop;
  
end;    
  

