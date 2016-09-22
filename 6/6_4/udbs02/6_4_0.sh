#!/bin/sh
. oraenv << EOF
u01sby1
EOF
dgmgrl << EOF1
connect sys/oracle_4U;
show configuration;
show database 'u01sby1' LogXptMode;
exit
EOF1
sqlplus / as sysdba <<EOF2
select instance_name,status from v\$instance;
show parameter log_archive_dest_1;
show parameter log_archive_dest_2;
quit;
EOF2
