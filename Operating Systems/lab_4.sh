#/usr/bin/zsh
USER=$(whoami); whoami
HOME_DIR=$(echo $HOME)
DATE=$(date "+%Y_%m_%d")

DATA=$(find $HOME_DIR -maxdepth 1 -type f -user $USER -exec readlink -f '{}' \;)
FILE_NAME="back_up_${USER}_${DATE}.tar"

if test -f "$FILE_NAME"; then
    read -p "Archive already exists, overwrite? " CONFIRM
    if [[ $CONFIRM == "yes" ]] || [[ $CONFIRM == "y" ]]; then
        echo "overwrite"
        tar -cf $FILE_NAME $DATA 2>/dev/null
    fi
else
    tar -cf $FILE_NAME $DATA 2>/dev/null
fi

chmod 444 $FILE_NAME
