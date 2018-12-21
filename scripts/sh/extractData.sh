#!/bin/bash


#unsetting proxy to hit api through curl

http_proxy=""


# Based on folderName of content for which file completely not downloaded , get metadata of that content from database

function sendReq {
	
	local FOLDER_NAME=$1
	
	echo "Processing:----->  ${FOLDER_NAME}"
 
	curl -s  -X POST   http://dev.media.jio.com/vodcmsprodv3apis/apis/getallcontent/getallcontent   -H 'Content-Type: application/json'   -H 'Postman-Token: 70fa93d1-101e-44e8-8fff-9113b676eb59'   -H 'cache-control: no-cache'   -d '{ "mainArr": [{
	                    "1": {
	                        "andArr": [{
	                            "name": "folderName",
	                            "value": "'${FOLDER_NAME}'",
	                            "pattern": "eq"
	                        }],
	                        "skip":0,
	                        "limit":1,
	                        "isAutomated": true
	                    }
	                }]
	}' | jq '.[0]["1"].data[0] | {contentId: .contentId,folderName: .folderName,createdDate: .createdDate,approved:.approved,category:.category,vendor:.vendor}'


}

# Extract FILEs for which downloading failed 

echo "extracting files..."
echo

grep -n 'Retrying.' /root/.forever/Gij5.log | grep 2018-12-1* |  
while read line
do  
	echo
	LINE_NO=$(echo $line | cut -d ":" -f 1)  
	NEXT_LINE=$((LINE_NO+30))
	OUTPUT=$(sed -n "${LINE_NO},${NEXT_LINE}p" /root/.forever/Gij5.log)
	echo "---------> OUTPUT : $OUTPUT"
	echo
done | 
grep 'Saving to' |  
while read line 
do
		echo 
                echo "Processing for : ${line}"            
        
                FOLDER=$(echo "$line" | cut -d "/" -f 6)
		
		echo 
	
		sendReq ${FOLDER}
	
done



# for each file which failed to download get it's metadata from db
#
#if [[ ${?} -eq 0 ]];then
#
#	echo "Files extracted !"	
#	
#	echo "${FILES}"		
#
#	for f in $FILES
#	do
#	
#		echo 
#		echo "Processing for : ${f}"		
#	
#		FOLDER=$(echo "$f" | cut -d "/" -f 6 )
#		
#				
#
#		sendReq $FOLDER
#
#	done	
#
#else
#	echo "something went wrong?"
#fi
