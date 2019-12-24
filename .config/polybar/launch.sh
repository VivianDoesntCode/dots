#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Multiple Monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload mid &
    MONITOR=$m polybar --reload right &
  done
else
  polybar --reload left &
  polybar --reload mid &
  polybar --reload right &
fi

# Launch bar1 and bar2
# polybar example  -r &

echo "Bars launched..."
