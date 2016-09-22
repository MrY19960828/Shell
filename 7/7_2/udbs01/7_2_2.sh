#!/bin/sh

cat >> ~/.bash_profile <<EOF
# add gg
export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/u01/gg:\$LD_LIBRARY_PATH
export GG_HOME=/u01/gg
export PATH=/u01/gg:\$PATH
EOF
