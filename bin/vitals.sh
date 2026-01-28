#!/bin/sh

echo watts      = $(battery_watt.sh)
echo picom      = $(compositor.sh)
echo fan speed  = $(fan_speed.sh)
echo gpu usage  = $(gpu_util.sh)
echo nmve temp  = $(nvme_temp.sh)
echo mode       = $(power_profile.sh)
