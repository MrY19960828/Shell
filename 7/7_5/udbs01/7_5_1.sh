#!/bin/sh

. oraenv << EOF1
orcla
EOF1
sqlplus / as sysdba <<EOF2
create user send identified by send default tablespace users temporary tablespace temp;
grant connect,resource,select_catalog_role to send;
conn send/send;
create table t1 as select * from dba_objects;
create table t2 as select object_id from dba_objects;
alter table t1 add constraint pk_1 primary key(object_id);
alter table t2 add constraint pk_2 primary key(object_id);
exit
EOF2
