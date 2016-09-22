#!/bin/sh

. oraenv << EOF1
u01sby1
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
show configuration;
convert database 'u01sby1' to physical standby;
show configuration;
quit
EOF2
sqlplus / as sysdba << EOF2
select instance_name,status from v\$instance;
select database_role from v\$database;
quit;
EOF2
