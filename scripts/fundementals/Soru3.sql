--1 den 9 a random olarak dizinin doldurulması
declare

  type NumberList is table of pls_integer index by pls_integer;
  nlist NumberList;

  v_max pls_integer := 9;
  x     pls_integer := 0;

  function getrandom(p_min pls_integer, p_max pls_integer) return number is
  begin
    x := x + 1;
    return trunc(dbms_random.value(p_min, p_max));
  end;


begin

  dbms_output.put_line('RESULT--------------------------' ||', '|| x);
  for i in nlist.first .. nlist.last loop
   dbms_output.put_line(i || ':' || nlist(i));
  end loop;

end;
