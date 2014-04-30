#!/bin/bash



Set=$1
SetResultFile=$2

StartTime=`date`


sleep 10


EndTime=`date`



echo "StartTime is    ${StartTime}">>${SetResultFile}

echo "EndTime   is    ${EndTime}">>${SetResultFile}
