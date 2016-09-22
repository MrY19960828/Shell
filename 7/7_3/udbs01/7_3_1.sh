#!/bin/sh
. oraenv << EOF1
orcla
EOF1
sqlplus / as sysdba <<EOF2
create user gg_user identified by gg_user default tablespace users temporary tablespace temp;
grant connect,resource,dba,unlimited tablespace to gg_user;
grant execute on utl_file to gg_user;
exec dbms_GoldenGate_auth.grant_admin_privilege('gg_user');
commit;
shutdown immediate;
startup mount;
alter database archivelog;
alter database add supplemental log data;
alter system set recyclebin=off scope=spfile;
alter database force logging;
shutdown immediate;
startup;
show parameter recyclebin;
select log_mode,supplemental_log_data_min,force_logging from v\$database;
exit
EOF2
