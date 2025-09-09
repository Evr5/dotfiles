#!/bin/bash

vesktop &
while ! hyprctl clients | grep -A 10 "class: vesktop" | grep -q 'title: .*Discord'; do
    sleep 0.5
done

code &
while ! hyprctl clients | grep -A 10 "class: code"; do
    sleep 0.5
done

kitty --title "autostart-terminal" &

google-chrome-stable --profile-directory="Default" &

