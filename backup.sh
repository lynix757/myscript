#!/bin/bash

CDATE=$(date +"%Y%m%d-%H%M") # Current date

#### Modify here  ########################################

RETENTION=7
SPATH="./source"
DPATH="./destination"
LOGPREFIX="log1"
FSRC="$SPATH/file1.txt" # source 
FDST="$DPATH/$LOGPREFIX-$CDATE.tar.gz" # destination

#### Modify here  ########################################

# Delete file older than xx Day
case $1 in

  ON)
    echo "Normal"
    echo "$FDST"
    tar -zcvf $FDST $FSRC

    # Check
    #echo ""
    #echo "# list file #"
    tar -tf $FDST

    #ls -lht $DPATH/*.tar.gz
    find $DPATH/$LOGPREFIX*.tar.gz -mtime +$RETENTION -delete
    ;;

  DELETEALLARCHIVE)
    echo "Delete All"
    find $DPATH/$LOGPREFIX*.tar.gz -delete
    ;;

  *)
    echo ""
    echo "ON - Normal"
    echo "DELETEALLARCHIVE - Delete all archive log"
    ;;
esac