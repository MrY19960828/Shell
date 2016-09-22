#!/bin/sh
. oraenv << EOF1
u01prmy
EOF1
sqlplus / as sysdba << EOF2
alter system switch logfile;
EOF2
