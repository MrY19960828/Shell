#!/bin/sh

rman <<EOF1
connect target / ;
backup database plus archivelog;
EOF1
