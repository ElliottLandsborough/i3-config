# i3 Config



## Installation
```
sudo apt-get install i3 i3lock scrot pgrep;
mkdir -p ~/Apps
cd ~/Apps
git clone --recursive -j8 git@bitbucket.org:eLands/i3-config.git;
mkdir -p ~/.config/i3;
mkdir -p ~/.config/i3status;
mv ~/.config/i3/config ~/.config/i3/config.bak;
mv ~/.config/i3status/config ~/.config/i3status/config.bak;
ln -s ~/Apps/i3-config/i3/config ~/.config/i3/config;
ln -s ~/Apps/i3-config/i3status/config ~/.config/i3status/config;
```
