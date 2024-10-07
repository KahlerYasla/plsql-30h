declare
  v_text varchar2(1000) := 'Before';

  procedure testInOut(p_text in out varchar2) is
  begin
    p_text := 'After';
    dbms_output.put_line('Inside testInOut ' || v_text);
  end;

  procedure testInOutNoCopy(p_text in out nocopy varchar2) is
  begin
    p_text := 'After';
    dbms_output.put_line('Inside testInOutNoCopy ' || v_text);
  end;

  procedure testInOutError(p_text in out varchar2) is
  begin
    p_text := 'After';
    dbms_output.put_line('Inside testInOutError ' || v_text);
    dbms_output.put_line(1 / 0);
  end;

  procedure testInOutNoCopyError(p_text in out nocopy varchar2) is
  begin
    p_text := 'After';
    dbms_output.put_line('Inside testInOutNoCopyError ' || v_text);
    dbms_output.put_line(1 / 0);
  end;

begin
  dbms_output.put_line('---------------------------------');
  dbms_output.put_line('Before testInOut ' || v_text);
  testInOut(v_text);
  dbms_output.put_line('After testInOut ' || v_text);

  v_text := 'Before';
  dbms_output.put_line('---------------------------------');

  dbms_output.put_line('Before testInOutNoCopy ' || v_text);
  testInOutNoCopy(v_text);
  dbms_output.put_line('After testInOutNoCopy ' || v_text);

  v_text := 'Before';

  dbms_output.put_line('--------------------------------- Error Sceneario ---------------------------------');
  dbms_output.put_line('--------------------------------- Error Sceneario ---------------------------------');  

  dbms_output.put_line('Before testInOutError ' || v_text);
  begin
    testInOutError(v_text);
  exception
    when others then
      null;
  end;
  dbms_output.put_line('After testInOutError ' || v_text);

  v_text := 'Before';
  dbms_output.put_line('---------------------------------');

  dbms_output.put_line('Before testInOutNoCopyError ' || v_text);
  begin
    testInOutNoCopyError(v_text);
  exception
    when others then
      null;
  end;
  dbms_output.put_line('After testInOutNoCopyError ' || v_text);
  dbms_output.put_line('---------------------------------');
end;
