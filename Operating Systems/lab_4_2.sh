#/usr/bin/zsh
CHANGE=$(tar -df $1 -C / | grep "Size differs" | cut -d":" -f1)
ALL=$(tar -tf $1)

for var in $ALL
do
    if [[ $CHANGE == *"${var}"* ]]; then
        read -p "overwrite? ${var} " CONFIRM
        if [[ $CONFIRM == "yes" ]] || [[ $CONFIRM == "y" ]]; then
            tar -xf $1 -C / $var
        fi
    else
        tar -xf $1 -C / $var
    fi
done 
