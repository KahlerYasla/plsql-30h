create or replace package PracticeLib is
    --pragma serially_reusable;
  -- Author  : AKADURLU
  -- Created : 19/09/2019 21:45:41
  -- Purpose : Agito PL/SQL Training Package

  -- Public type declarations
  type list_emp is table of employees%rowtype index by pls_integer;
  l_emp list_emp;

  -- Public constant declarations
  AGITO constant varchar2(1) := 'T';

  INITIALIZE_1 pls_integer := InitializeTest('Spec Variable INITIALIZE_11');
  INITIALIZE_2 pls_integer := InitializeTest('Spec Variable INITIALIZE_2');

  procedure sayHi;

end PracticeLib;
/
create or replace package body PracticeLib is
   -- pragma serially_reusable;

  INITIALIZE_3 pls_integer := InitializeTest('Body Variable INITIALIZE_3');

  procedure sayHi is
  begin
    dbms_output.put_line('Hi baby');
  end;

begin
  dbms_output.put_line('Package Initialized');
  select * bulk collect into l_emp from employees;
  INITIALIZE_3 := 2; 
end PracticeLib;
/
