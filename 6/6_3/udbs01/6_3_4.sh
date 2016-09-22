#!/bin/sh
. oraenv << EOF1
u01prmy
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
add database 'u01sby1' as connect identifier is u01sby1;
show configuration;
EOF2
