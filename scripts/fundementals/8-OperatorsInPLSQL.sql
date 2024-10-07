declare
  v_test    pls_integer;
  v_boolean boolean;
begin
  v_test := 1 * 1 / 1 - 1 + 2;

  v_boolean := 1 = 1 and 1 <> 1 and 1 != 1 and 1 like 1 and 1 is null and 1 between 1 and 1 or 1 = 2 and not 1=1;

end;
