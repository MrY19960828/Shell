#!/bin/sh
. oraenv << EOF1
u01sby1
EOF1
sqlplus / as sysdba << EOF2
alter system set local_listener=u01sby1;
show parameter local_listener;
EOF2
