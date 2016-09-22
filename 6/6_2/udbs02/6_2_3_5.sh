#!/bin/sh
. oraenv << EOF
u01sby1
/u01/app/oracle/product/11.2.0/dbhome_1
EOF
export ORACLE_SID=u01sby1
echo $ORACLE_SID
sqlplus / as sysdba << EOF1
startup nomount pfile=$ORACLE_HOME/dbs/initu01sby1.ora
EOF1
