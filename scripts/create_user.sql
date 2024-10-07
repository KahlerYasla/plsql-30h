--DROP USER <replace user> CASCADE;

CREATE USER <replace user>
  IDENTIFIED BY 1
  PROFILE DEFAULT
  ACCOUNT UNLOCK;

  GRANT CONNECT TO <replace user>;
  GRANT DBA TO <replace user>;
  GRANT RESOURCE TO <replace user>;
  ALTER USER <replace user> DEFAULT ROLE ALL;
 
