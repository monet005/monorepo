#!/bin/bash

#infra1:x:5002:5000:Infra user ID:/home/infra1:/bin/bash

USERNAME=$1
TESTFILE=/tmp/testfile_by_${USERNAME}
declare -i PASSWD_ENTRY_COUNT
declare -i DUPCOUNT=0
declare -i BADCOUNT=0
PASSWD_ENTRY_COUNT=$(grep -c ^"$USERNAME" /etc/passwd)
badlines=()

su "$USERNAME" -c "touch $TESTFILE"
REALUID=$(stat -c "%u" "$TESTFILE")
REALGID=$(stat -c "%g" "$TESTFILE")

cp /etc/passwd /etc/passwd.staging

iif