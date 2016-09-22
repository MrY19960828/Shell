#!/bin/sh
. oraenv << EOF1
orclb
EOF1
sqlplus / as sysdba <<EOF2
create user gg_user identified by gg_user default tablespace users temporary tablespace temp;
grant connect,resource,dba,unlimited tablespace to gg_user;
grant execute on utl_file to gg_user;
exec dbms_GoldenGate_auth.grant_admin_privilege('gg_user');
commit;
exit
EOF2

