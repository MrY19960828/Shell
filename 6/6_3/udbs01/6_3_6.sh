#!/bin/sh
. oraenv << EOF1
u01prmy
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
show configuration;
switchover to 'u01prmy';
show configuration;
EOF2
