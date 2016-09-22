#!/bin/sh
. oraenv << EOF1
u01prmy
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
create configuration 'DGConfig1' as primary database is 'u01prmy' connect identifier is u01prmy;
show configuration;
EOF2
