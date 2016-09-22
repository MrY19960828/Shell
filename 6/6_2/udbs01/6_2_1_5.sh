#!/bin/sh

. oraenv <<EOF1
u01prmy
EOF1
sqlplus / as sysdba <<EOF2
alter system set db_recovery_file_dest_size=5G;
EOF2
