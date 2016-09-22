#!/bin/sh
. oraenv << EOF1
orcla
EOF1
cd /u01/gg
# xx
sqlplus / as sysdba <<EOF2
@marker_setup.sql << EOF3
gg_user
EOF3
@ddl_setup.sql << EOF3
gg_user
EOF3
@role_setup.sql<< EOF3
gg_user
EOF3
grant GGS_GGSUSER_ROLE to gg_user;
@ddl_enable.sql << EOF3
gg_USER
EOF3
exit
EOF2
