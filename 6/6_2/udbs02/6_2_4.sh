#!/bin/sh

. oraenv << EOF1
u01sby1
EOF1
sqlplus / as sysdba << EOF2
select sequence#,first_time,next_time,applied from v\$archived_log order by 1;
EOF2
