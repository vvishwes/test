#!/bin/bash
# testingmodifiy
# USAGE: db_connect.sh <dbname> <dbhome>
databasename=$1
dbnm=`echo $databasename | tr A-Z a-z`
dbhome=$2
echo "connecting to  database $dbnm... "
export ORACLE_HOME=$dbhome
export ORACLE_SID=${dbnm}1
su oracle -c "$dbhome/bin/sqlplus -s / as sysdba <<!
spool something
select name from v\\\$database;
spool off;
exit
!
"