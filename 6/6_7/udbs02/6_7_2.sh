#!/bin/sh

. oraenv << EOF1
u01sby1
EOF1

dgmgrl << EOF2
connecct sys/oracle_4U;
edit database 'u01sby1' set state='apply-off';
EOF2

sqlplus / as sysdba << EOF3
select instance_name,status from v\$instance;
alter system set db_flashback_retention_target=2880 scope=both;
alter database flashback on;
exit
EOF3

dgmgrl << EOF3
connect sys/oracle_4U;
edit database 'u01sby1' set state='apply-on';
exit;
EOF3
