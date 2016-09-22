#!/bin/sh

. oraenv << EOF1
u01sby1
EOF1
sqlplus / as sysdba << EOF1
select instance_name,status from v\$instance;
alter database recover to logical standby u01sby1;
exit;
EOF1
orapwd file=$ORACLE_HOME/dbs/orau01sby1 password=oracle_4U entries=5;

sqlplus sys/oracle_4U as sysdba << EOF1
connect sys/oracle_4U as sysdba;
startup mount;
alter system set log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST DB_UNIQUE_NAME=u01prmy';
alter system set log_archive_dest_3='LOCATION=/home/oracle/ VALID_FOR=(STANDBY_LOGFILES,STANDBY_ROLE) DB_UNIQUE_NAME=u01prmy';
shutdown immediate;
startup mount;
alter database open resetlogs;
alter database start logical standby apply immediate;
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
remove database 'u01sby1';
show configuration;
enable database 'u01sby1';
show configuration;
EOF2
