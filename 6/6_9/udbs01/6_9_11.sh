#!/bin/sh

. oraenv << EOF1
u01prmy
EOF1
sqlplus / as sysdba << EOF1
select instance_name,status from v\$instance;
select max(sequence#),thread# from v\$archived_log group by thread#;
EOF1
