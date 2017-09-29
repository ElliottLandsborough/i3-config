#!/usr/bin/env bash
totalCapacity=0;
batCount=0;

bat=/sys/class/power_supply/BAT0/capacity;
if [ -f bat ]; then
	batCap=$(cat ${bat});
	totalCapacity=$(($totalCapacity + $batCap));
	batCount=$(($batCount + 1));
fi

bat=/sys/class/power_supply/BAT1/capacity;
if [ -f bat ]; then
	batCap=$(cat ${bat});
	totalCapacity=$(($totalCapacity + $batCap));
	batCount=$(($batCount + 1));
fi

if [ "${batCount}" == "0" ]; then
	echo 'N/A';
else
	echo $(($totalCapacity / $batCount))
fi