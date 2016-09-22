#!/bin/sh

# mode MaxPerformance
. oraenv << EOF1
u01prmy
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
show configuration verbose;
show fast_start failover;

exit;
EOF2
