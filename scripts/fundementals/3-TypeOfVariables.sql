declare
  --Scalar Data Types
  v_char      char := '1';
  v_string    varchar2(100) := '1';
  v_boolean   boolean := true;
  v_integer   pls_integer := 1;
  v_number    number(26, 6) := 123.123;
  v_date      date := sysdate;
  v_timestamp timestamp := systimestamp;
  v_type      employees.employee_id%type;

  --LOB Data Types
  v_clob  clob;
  v_blob  blob;
  v_bfile bfile;

  --Composite Data Types
  type rec_test is record(
    name      varchar2(15),
    telnumber number(22));
  type list_test is table of rec_test /*not null */ index by binary_integer;
  
  r_test rec_test;
  l_test list_test;
  
  --Referance Data Types
  --variable va_test number
  --begin :va_test := 1; end;/  

begin
  null;
end;
