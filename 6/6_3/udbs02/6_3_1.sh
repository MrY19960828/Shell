#!/bin/sh
. oraenv << EOF1
u01sby1
EOF1
sqlplus / as sysdba << EOF2
show parameter dg_broker_start;
alter system set dg_broker_start=true;
show parameter dg_broker_start;
show parameter dg_broker_config;
EOF2
