#!/usr/bin/env bash
# limit volume to a maximum, step by amounts
# volume.sh +
# volume.sh -
# volume.sh set 95
MAX=100; # max volume allowed
STEP=10; #percentage to step up and down in
MODE=$1; # e.g + or - or 'set'
PERCENTAGE=$2; # e. 100 (%)
LINK=$(pactl list short sinks | grep RUNNING | cut -f1);
CURRENTVOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $LINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,');
DESIREDVOLUME=CURRENTVOLUME; # init the value

if [ "${MODE}" == 'set' ]
	then
		DESIREDVOLUME=$PERCENTAGE;
fi

if [ $MODE == '+' ]
	then 
		DESIREDVOLUME=$(($CURRENTVOLUME + $STEP));
fi

if [ "${MODE}" == '-' ]
	then 
		DESIREDVOLUME=$(($CURRENTVOLUME - $STEP));
fi

if test $DESIREDVOLUME -gt $MAX
 	then
    	DESIREDVOLUME=$MAX;
fi

pactl set-sink-volume 1 ${DESIREDVOLUME}%;