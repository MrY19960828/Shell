#!/bin/sh

. oraenv << EOF1
u01sby1
EOF1
sqlplus / as sysdba << EOF1
select instance_name,status from v\$instance;
select sequence#,fist_change#,next_change#,timestamp,applied from dba_logstdby_log;
EOF1
