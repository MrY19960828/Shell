#!/bin/sh

. oraenv << EOF
u01sby1
EOF
dgmgrl << EOF1
connect sys/oracle_4U;
edit database 'u01sby1' set state='apply-off';
exit;
EOF1
sqlplus / as sysdba << EOF2
select instance_name,status from v\$instance;
alter database open read only;
EOF2
dgmgrl << EOF1
connect sys/oracle_4U;
edit database 'u01sby1' set state='apply-on';
exit;
EOF1

