#!/bin/bash

export ORACLE_HOME=$ORACLE_BASE/product/12.1.0/db_1

$ORACLE_HOME/bin/dbca -silent \
-createDatabase \
-templateName General_Purpose.dbc \
-gdbName orcl \
-sid orcl \
-createAsContainerDatabase true \
-numberOfPdbs 1 \
-pdbName pdb \
-pdbadminUsername tim \
-pdbadminPassword Rootme99 \
-SysPassword Rootme99 \
-SystemPassword Rootme99 \
-emConfiguration NONE \
-datafileDestination /opt/app/oracle/oradata \
-storageType FS \
-characterSet AL32UTF8 \
-memoryPercentage 40 \
-listeners LISTENER
