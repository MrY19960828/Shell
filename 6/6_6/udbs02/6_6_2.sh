#!/bin/sh

. oraenv << EOF
u01sby1
EOF
sqlplus / as sysdba << EOF2
select instance_name,status from v\$instance;
shutdown immediate;
startup mount;
select instance_name,status from v\$instance;
EOF2

