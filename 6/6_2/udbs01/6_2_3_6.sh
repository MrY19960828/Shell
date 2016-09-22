#!/bin/sh
rman << EOF
connect target sys/oracle_4U;
connect auxiliary sys/oracle_4U@u01sby1;
@phys_sby1.txt
EOF
