#!/bin/bash
FILE_TO_SEND="$1"

if [ -z "$FILE_TO_SEND" ]; then
    kdialog --title "Send what?" --error "There was no file specified to send."
else
    scp -P YOUR_SSH_PORT "$FILE_TO_SEND" YOUR_HOST_HERE:/path/to/your/public/dir
    if [ $? -eq 0 ]; then
        FILENAME=`printf "${FILE_TO_SEND##*/}" | jq -sRr @uri`
        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            echo "https://plzlookat.mystupid.pictures/$FILENAME" | wl-copy
        else
            echo "https://plzlookat.mystupid.pictures/$FILENAME" | xclip -r -selection c
        fi
        kdialog --title "Link copied" --passivepopup "Link to the file has been copied to the clipboard." 5
    else
        kdialog --title "Link copied" --error "There was an error transferring the file. Did you set up your parameters correctly?"
    fi
fi
