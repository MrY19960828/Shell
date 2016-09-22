#!/bin/sh

# mode MaxPerformance

. oraenv << EOF1
u01sby1
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
stop observer;
disable fast_start failover;
show configuration;
exit;
EOF2
