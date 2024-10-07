create or replace function refcursor_test return  sys_refcursor is

  c_emp sys_refcursor;
  v_sql varchar2(100) := 'select * from employees where 1=1';
begin
  open c_emp for v_sql;
  return c_emp;
end;
/

declare
  v_stmt  varchar2(100) := '1+3';
  v_deger varchar2(100);

  type rc_emp is ref cursor;
  c_emp rc_emp;
  r_emp employees%rowtype;
  v_sql varchar2(100) := 'select * from employees where 1=1';

begin
  --1. method 
  execute immediate 'declare
  v_test number := 1;
begin
  dbms_output.put_line(v_test);
end;';
  --2. method

  EXECUTE IMMEDIATE 'begin :c := ' || v_stmt || '; end;'
    USING out v_deger;
  dbms_output.put_line(v_deger);

  v_sql := v_sql || ' and employee_id = 169';
  

  dbms_output.put_line( v_sql);
  
  --3.method
  open c_emp for v_sql;
  loop
    fetch c_emp
      into r_emp;
    exit when c_emp%notfound;
    dbms_output.put_line(r_emp.employee_id);
  end loop;

  --Job_id si SH_CLERK olan tüm db yi ST_CLERK yapan kod
end;
--user_tables içerisindeki tablolarýn kayýt sayýlarýný tablo ismi ile ekranda yazdýran kod?
