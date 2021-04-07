#!/bin/bash

RETENTION=7
CDATE=$(date +"%Y%m%d-%H%M") # Current date
SPATH="."
DPATH="."
FSRC="$SPATH/file1.txt" # source 
FDST="$DPATH/archive_log-$CDATE.tar.gz" # destination

# Delete file older than xx Day
#find $DPATH/*.tar.gz -mtime +1 -delete
if [ $1 == "DELETEALLARCHIVE" ] 
then
    #rm -f "$DPATH/*.tar.gz"
    find $DPATH/*.tar.gz -delete
else
    echo "$FDST"
    tar -zcvf $FDST $FSRC
    # Check
    echo ""
    echo "# list file #"
    tar -tf $FDST
    ls -lht $DPATH/*.tar.gz
    find $DPATH/*.tar.gz -mtime +$RETENTION -delete
fi


