# i3 Config



## Installation
```
sudo apt install i3 i3lock scrot xbacklight j4-dmenu-desktop imagemagick;
mkdir -p ~/Apps
cd ~/Apps
git clone --recursive git@bitbucket.org:eLands/i3-config.git;
mkdir -p ~/.config/i3;
mkdir -p ~/.config/i3status;
mkdir -p ~/.config/goblocks;
mv ~/.config/i3/config ~/.config/i3/config.bak;
mv ~/.config/i3status/config ~/.config/i3status/config.bak;
mv ~/.config/goblocks/goblocks.yml ~/.config/goblocks/goblocks.yml;
ln -s ~/Apps/i3-config/i3/config ~/.config/i3/config;
ln -s ~/Apps/i3-config/i3status/config ~/.config/i3status/config;
ln -s ~/Apps/i3-config/goblocks/goblocks.yml ~/.config/goblocks/goblocks.yml;
go get github.com/ElliottLandsborough/goblocks;
```

## Get lid status
```
grep -Fxq "open" /proc/acpi/button/lid/LID/state
```