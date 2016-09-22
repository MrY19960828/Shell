#!/bin/sh

# mode MaxPerformance

. oraenv << EOF1
u01sby1
EOF1
dgmgrl << EOF2
connect sys/oracle_4U;
edit database 'u01prmy' set property FastStartFailovertarget='u01sby1';
edit database 'u01sby1' set property FastStartFailovertarget='u01prmy';
show configuration;
show database 'u01prmy' logxptmode;
show database 'u01sby1' logxptmode;
edit configuration set property FastStartFailoverThreshold=90;
edit configuration set property FastStartFailoverLagLimit=60;
enable fast_start failover;
show configuration verbose;
exit;
EOF2
