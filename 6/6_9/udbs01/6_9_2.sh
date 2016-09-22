#!/bin/sh

. oraenv << EOF1
u01prmy
EOF1
sqlplus / as sysdba << EOF1
alter system set log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST DB_UNIQUE_NAME=u01prmy';
alter system set log_archive_dest_3='LOCATION=/home/oracle/ VALID_FOR=(STANDBY_LOGFILES,STANDBY_ROLE) DB_UNIQUE_NAME=u01prmy';
execute dbms_logstdby.build;
EOF1
