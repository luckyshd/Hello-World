et=$1
SetResultFile=$2

StartTime=`date`
sleep 60

echo ""


EndTime=`date`

echo "StartTime is       ${StartTime}">>${SetResultFile}
echo "EndTime   is       ${EndTime}">>${SetResultFile}

