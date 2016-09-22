#!/bin/sh
. oraenv << EOF1
u01prmy
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
enable configuration;
show configuration;
EOF2
