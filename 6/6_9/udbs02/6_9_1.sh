#!/bin/sh

. oraenv << EOF1
u01sby1
EOF1
sqlplus / as sysdba << EOF1
select instance_name,status from v\$instance;
alter database recover managed standby database cancel;
exit;
EOF1
