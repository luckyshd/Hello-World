#!/bin/bash


UserName=`whoami`
WorkingDir=`pwd`
AllTestDataDir="${WorkingDir}/AllTestData"
TestFile="SetTest.sh"
ResultFile="AllTestResult.info"

#data
StartTime=""
EndTime=""
declare -a TestSet
TestSet=(A  B  C  D )



if [[ $UserName = "root"  ]]
then
	echo "root is not allow for this project"
	return 1
fi


if [ -d  ${AllTestDataDir}   ]
then
	rm -rf ${AllTestDataDir}
fi


for Set in ${TestSet[@]}
do
	mkdir -p  ${AllTestDataDir}/${Set}
	cp  ${TestFile}    ${AllTestDataDir}/${Set}
done


####################
#all test
StartTime=`date`
for Set in ${TestSet[@]}
do
    SetResult="${Set}_restult.info"
	cd  ${AllTestDataDir}/${Set}
	echo ""
	echo "SetResult file is ${SetResult}"
	./${TestFile}  ${Set}  "${SetResult}"
	cd ${WorkingDir}
done
EndTime=`date`

#########################
echo ""
echo ""
echo "start time is      $StartTime"
echo ""
for Set in ${TestSet[@]}
do
    echo ""
	echo "set is ${Set}"
    SetResult="${Set}_restult.info"
	cat  ${AllTestDataDir}/${Set}/${SetResult}
done

echo ""
echo ""
echo "End  time is      $EndTime"
#####################

exit 1




