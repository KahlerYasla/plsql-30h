create or replace package resultcache is

  -- Author  : AKADURLU
  -- Created : 28/07/2021 10:19:08
  -- Purpose : 


  -- Public function and procedure declarations
  function GetToken return varchar2 result_cache;
  procedure SetToken (p_token varchar2) ;
end resultcache;
/
create or replace package body resultcache is

  TOKEN varchar2(1000);
  
  -- Function and procedure implementations
  function GetToken return varchar2 result_cache is
  begin
    return TOKEN;
  end;
  
  procedure SetToken (p_token varchar2) is
  begin
    
    DBMS_RESULT_CACHE.Delete_Dependency(sys_context( 'userenv', 'current_schema' ) , $$PLSQL_UNIT);    
    TOKEN := p_token;
  end;  
end resultcache;
/
