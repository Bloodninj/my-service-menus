#!/bin/bash
FILE_TO_SEND=$1

if [ -z "$FILE_TO_SEND" ]; then
    kdialog --title "Send what?" --error "There was no file specified to send."
else
    scp -P YOUR_SSH_PORT $FILE_TO_SEND YOUR_HOST_HERE:/path/to/your/public/dir
    if [ $? -eq 0 ]; then
        FILENAME="${FILE_TO_SEND##*/}"
        echo "https://YOUR_URL_HERE/$FILENAME" | xclip -r -selection c
        kdialog --title "Link copied" --passivepopup "Link to the file has been copied to the clipboard." 5
    else
        kdialog --title "Link copied" --error "There was an error transferring the file. Did you set up your parameters correctly?"
    fi
fi
