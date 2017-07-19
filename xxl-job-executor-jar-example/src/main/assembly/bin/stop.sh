#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd`
cd ..
PID=`cat pid`
kill $PID > /dev/null 2>&1

COUNT=0
while [ $COUNT -lt 1 ]; do
    echo -e ".\c"
    sleep 1
    COUNT=1
    PID_EXIST=`ps -f -p $PID | grep java`
    if [ -n "$PID_EXIST" ]; then
        COUNT=0
        break
    fi
done

echo "OK!"
echo "PID: $PID"
