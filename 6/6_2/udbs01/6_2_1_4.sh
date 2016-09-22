#!/bin/sh

. oraenv <<EOF1
u01prmy
EOF1
sqlplus / as sysdba <<EOF2
archive log list;
shutdown immediate;
startup mount;
alter database archivelog;
alter database open;
EOF2
