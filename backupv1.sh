#!/bin/sh
# ---------------------------------------------------------------------------------------------------------

## date format ##
YDAY=$(date -d yesterday +"%F")
NOW=$(date +"%F")
NOWT=$(date +"%T")

## Backup path ##
BAK="/var/backuplog/$YDAY"
WEBBAK="/var/backuplog/weblog/$YDAY"
ACTLOGS="/var/backup-activity-log/$YDAY"

## Logs path ##

LPATH="/var/log/remote_log"

## device-01  ##
LFILE1="$LPATH/10.0.1.11.log.1.gz"
DFILE1="$BAK-FW1-10.0.1.11.gz"
SHAFILE1="$BAK-FW1-10.0.1.11.gz.sha1"

cp $LFILE1 $DFILE1
sha1sum $DFILE1 > $SHAFILE1

##### Last File Number is 13 #######

################################
#### Record Script Activity ####
################################

## SHA1SUM INFO ##
#SYSINFO="$ACTLOGs-LOGs-Backup-Activity.txt"
#date > $SYSINFO
#cd /var/backuplog/
#cat *.sha1 >> $SYSINFO 
#date >> $SYSINFO
#ls -l $LPATH  >> $SYSINFO
#date >> $SYSINFO 
#df -h >> $SYSINFO 

################################
## SHA1SUM INFO ##
SYSINFO="$BAK-ServInfo.txt"
echo "Daily Log Rotate on Syslog Server 10.255.0.10" > $SYSINFO
date >> $SYSINFO
#echo "\n"  >> $SYSINFO
cd /var/backuplog/  >> $SYSINFO
pwd  >> $SYSINFO
cat $YDAY-*.sha1  >> $SYSINFO
echo "\n"  >> $SYSINFO
echo "Real Time Syslog" >> $SYSINFO
date  >> $SYSINFO
ls -lht $LPATH/*.log  >> $SYSINFO
echo "\n"  >> $SYSINFO
echo "\n CPU Usage" >> $SYSINFO
date >> $SYSINFO

echo "\n Memory Usage" >> $SYSINFO
date >> $SYSINFO
free -m >> $SYSINFO
echo "\n Disk Usage" >> $SYSINFO
date  >> $SYSINFO
df -h  >> $SYSINFO
echo "\n"  >> $SYSINFO

# Delete older 240 Day  file infra
find /var/backuplog/* -mtime +240 -delete

# Delete older 240 Day  file weblog
find /var/backuplog/weblog/* -mtime +240 -delete

#mail -s"SyslogInfo Daily Syslog Backup" "cccccccc@gmail.com" < $SYSINFO
