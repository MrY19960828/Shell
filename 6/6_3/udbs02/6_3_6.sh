#!/bin/sh
. oraenv << EOF1
u01sby1
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
switchover to 'u01sby1';
show configuration;
EOF2
