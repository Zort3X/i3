if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload Zer7 &
  done
else
  polybar --reload Zer7 &
fi
