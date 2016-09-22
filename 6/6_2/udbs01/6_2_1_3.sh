#!/bin/sh

. oraenv <<EOF1
u01prmy
EOF1
sqlplus / as sysdba <<EOF2
alter system set log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST';
alter system set log_archive_config='dg_config=(u01prmy,u01sby1)';
show parameter log_archive_config;
alter system set log_archive_dest_2='service=u01sby1 async valid_for=(online_logfile,primary_role) db_unique_name=u01sby1';
show parameter log_archive_dest_2;
EOF2
