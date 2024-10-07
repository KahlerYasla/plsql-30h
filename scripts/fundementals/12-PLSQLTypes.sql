declare
  r_emp employees%rowtype;
  
  type list_emp is table of employees%rowtype index by pls_integer;
  l_emp list_emp;  

  type rec_test is record(
    first_name varchar2(100),
    last_name  varchar2(100));
    
  r_test rec_test;
  


  
  type list_test is table of pls_integer index by pls_integer;
  l_test list_test;
    

  type list_test2 is table of pls_integer index by varchar2(10);
  l_test2 list_test2;  


  i pls_integer;
  j varchar2(10);
begin
  r_test.first_name := 'OzzY';
  r_test.last_name := 'dasda';  

  select * into r_emp from employees where employee_id = 198;
  dbms_output.put_line(r_emp.first_name);



  for i in 1 .. 10 loop
    l_emp(i) := r_emp;
  end loop;
  --dbms_output.put_line(l_emp(15).first_name);

  if not l_emp.exists(11) then
    dbms_output.put_line('11. index is not exists');
  end if;

  l_emp.delete(3);

  dbms_output.put_line('List size ' || l_emp.count);
  

  i := l_emp.first;

  while i is not null loop
    dbms_output.put_line('index : ' || i);
    
    
    i := l_emp.next(i);
  end loop;

  l_emp.delete;
  dbms_output.put_line('List size after delete ' || l_emp.count);

  dbms_output.put_line('Ordered example');
  l_test(5) := 1;
  l_test(3) := 0;
  l_test(1) := null;

  dbms_output.put_line('List size ' || l_test.count);
  
  i := l_test.first;
  while i is not null loop
    
    dbms_output.put_line('key : ' || i || ' value : ' || l_test(i));
    
    i := l_test.next(i);
  end loop;

  l_test2('Z') := 1;
  l_test2('A') := 2;

  j := l_test2.first;
  while j is not null loop
    dbms_output.put_line('key : ' || j || ' value : ' || l_test2(j));
    j := l_test2.next(j);
  end loop;
end;


/*

declare

  tmntkod index olacak þekilde tmntutarý ve primtutarýný içeren bir plsql type oluþturun
  
begin
  hardcode 2 satýr tanýmlama yap 
  ve loopa dön ama while
end;    

*/


/*

declare
  type rec_kur is record(
    efkal  number(4, 2),
    efksat number(4, 2));

  type list_test is table of rec_kur index by varchar2(3);

  v_kur list_test;

  v_index varchar2(3);
begin
  v_kur('USD').efkal := 1;
  v_kur('USD').efksat := 2;
  v_kur('EUR').efkal := 3;
  v_kur('EUR').efksat := 4;
  -- ekrana yazýn

  v_index := v_kur.first;
  while v_index is not null loop
    ---bu arada istediðin kodu yaz
    dbms_output.put_line(v_index || ' dövizkodu efkal kuru ' || v_kur(v_index).efkal || ', efksat kuru ' || v_kur(v_index)
                         .efksat);
  
    --
    v_index := v_kur.next(v_index);
  end loop;
  --

end;



*/
