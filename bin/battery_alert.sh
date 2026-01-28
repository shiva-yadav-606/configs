#!/bin/sh

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

notify-send $BATTERY_LEVEL
sleep 1

if [ "$BATTERY_LEVEL" -gt 90 ] && [ "$BATTERY_DISCHARGING" -eq 0 ]; then
	notify-send "Battery Charged" "Battery is fully charged."
elif [ "$BATTERY_LEVEL" -le 35 ] && [ "$BATTERY_DISCHARGING" -eq 1 ]; then 
	notify-send "Low Battery" "${BATTERY_LEVEL}% of battery remaining."  
fi

# */3 * * * * /home/shiva/.local/bin/battery-alert