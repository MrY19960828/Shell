#!/bin/sh

. oraenv << EOF
u01prmy
EOF

sqlplus / as sysdba <<EOF2
select instance_name,status from v\$instance;
archive log list;
shutdown immediate;
startup mount;
alter database archivelog;
alter system set db_flashback_retention_target=2880 scope=both;
alter database flashback on;
alter database open;
select flashback_on from v\$database;
quit;
EOF2
