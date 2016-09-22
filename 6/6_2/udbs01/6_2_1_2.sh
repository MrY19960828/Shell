#!/bin/sh

. oraenv <<EOF1
u01prmy
EOF1
sqlplus / as sysdba <<EOF2
select group#,bytes from v\$log;
alter database add standby logfile '+DATA' size 50M;
alter database add standby logfile '+DATA' size 50M;
alter database add standby logfile '+DATA' size 50M;
alter database add standby logfile '+DATA' size 50M;
EOF2
