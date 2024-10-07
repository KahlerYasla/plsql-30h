create or replace procedure topla(p_a pls_integer,
                                  p_b pls_integer) is
begin
  dbms_output.put_line(p_a + p_b);
end;

create or replace function cikar(p_a pls_integer,
                                 p_b pls_integer) return pls_integer is
begin
  return p_a - p_b;
end;

begin
  topla(1, 2);
  dbms_output.put_line(cikar(3, 3));
end;
