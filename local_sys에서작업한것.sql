show user;
-- USER이(가) "SYS"입니다.

select * from dba_users;

select table_name, tablespace_name
from dba_tables
where owner = 'HR' and table_name = 'EMPLOYEES';

select tablespace_name, file_name
-- from dba_tablespaces;   -- file_name 이 안나옴
from dba_data_files
where tablespace_name = 'USERS';
-- USERS    C:\ORACLEXE18C\PRODUCT\18.0.0\ORADATA\XE\USERS01.DBF

