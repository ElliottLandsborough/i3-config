bat0=$(cat /sys/class/power_supply/BAT0/capacity);
bat1=$(cat /sys/class/power_supply/BAT1/capacity);
total=$(($bat0 + $bat1));
echo "$(($total / 2))";