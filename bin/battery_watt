#!/bin/sh


is_running() {
    sensors | grep curr1: | grep mA >/dev/null
}

val1=$(sensors | grep curr1: | awk '{print $2}')
val2=$(sensors | grep in0: | awk '{print $2}')

if is_running; then
    watt=$(echo "scale=2; (($val1/1000) * $val2) / 1" | bc)
    rounded=$(printf "%.1f" "$watt")   
    echo ${rounded}
else
    watt=$(echo "scale=2; ($val1 * $val2) / 1" | bc)
    rounded=$(printf "%.1f" "$watt")   
    echo ${rounded}
fi



