
#!/bin/sh

muted=$(pamixer --sink 0 --get-mute)

if [ "$muted" = true ]; then
    echo " --"
else
    volume=$(pamixer --sink 0 --get-volume)

    if [ "$volume" -gt 49 ]; then
        echo " $volume %"
    else
        echo " $volume %"
    fi
fi 
