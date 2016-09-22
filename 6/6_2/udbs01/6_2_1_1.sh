#!/bin/sh

. oraenv <<EOF1
u01prmy
EOF1
sqlplus / as sysdba <<EOF2
select force_logging from v\$database;
alter database force logging;
select force_logging from v\$database;
EOF2
