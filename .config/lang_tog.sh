current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$current_layout" = "us" ]; then
    setxkbmap -layout bg -variant phonetic
else
    setxkbmap -layout us
fi
