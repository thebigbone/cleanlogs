!/bin/bash

LOG_DIR=/var/log/mullvad-vpn #dir to clean
LOG_FILE=daemon.old.log
ROOT_UID=0 #only root exec
LINES=50 #default no. of saved lines
E_XCD=66 #can't change the directory
E_NONROOT=67 #non-root exit error

if [ "$UID" -ne "$ROOT_UID" ]
then
        echo "must be root to run this script."
        exit $E_NONROOT
fi

if [ -n "$1" ]
#test if command line arg exist (non-empty)
then
        lines=$1
else
        lines=$LINES #default if not specified on command line
fi

cd $LOG_DIR #cd into the dir

if [ "$PWD" != "$LOG_DIR" ] #for checking if current dir is log_dir 
then
        echo "can't change to $LOG_DIR"
        exit $E_XCD
fi


cat /dev/null > $LOG_FILE
echo "logs cleaned up!"

exit 0
