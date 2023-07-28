#!/bin/bash

#infra1:x:5002:5000:Infra user ID:/home/infra1:/bin/bash

USERNAME=$1
TESTFILE=/tmp/testfile_by_${USERNAME}

su "$USERNAME" -c "touch $TESTFILE"
REALUID=$(stat -c "%u" "$TESTFILE")
REALGID=$(stat -c "%g" "$TESTFILE")

cp /etc/passwd /etc/passwd.staging

if [[ $(grep -c ^"$USERNAME" /etc/passwd) -gt 1 ]]; then
    echo "there is a duplicate entry"
    while read -r line; do
    # to an if statement here 
        BAD_ENTRY=$(echo "$line" | grep -v ^"$USERNAME:x:$REALUID:$REALGID")
        DUP_ENTRY=$(echo "$line" | grep ^"$USERNAME:x:$REALUID:$REALGID")

        if [[ -n "$BAD_ENTRY" ]]; then
            echo "removing bad entry"
        fi

        if [[ -n "$DUP_ENTRY" ]]; then
            echo "removing duplicate entry"
        fi
    done <<< "$(grep ^"$USERNAME" /etc/passwd)"
else
    echo "no duplicate entry"
fi





rm -f "$TESTFILE"


# check if there is a duplicate
# if there is a duplicate
#    if exact duplicate, remove it
#     if entry has different uid, test the realid then remove it

  