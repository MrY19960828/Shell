#!/bin/sh
. oraenv << EOF
u01prmy
EOF
sqlplus / as sysdba << EOF2
alter system switch logfile;
EOF2

ssh oracle@udbs02<<EOF8
cat >> /etc/oratab << EOF3
u01sby1:/u01/app/oracle/product/11.2.0/dbhome_1:N
EOF3
. oraenv << EOF4
u01sby1
EOF4
sqlplus / as sysdba << EOF5
alter database recover managed standby database using current logfile disconnect;
EOF5
EOF8
