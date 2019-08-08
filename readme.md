# i3 Config



## Installation
```
sudo apt install i3 i3lock scrot xbacklight j4-dmenu-desktop imagemagick feh wicd-gtk xfce4-power-manager shutter;
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

```
wget https://raw.githubusercontent.com/ArtBIT/shutter-cloudapp-plugin/master/CloudApp.pm;
sudo mv CloudApp.pm /usr/share/shutter/resources/system/upload_plugins/upload/CloudApp.pm;
sudo chown root:root /usr/share/shutter/resources/system/upload_plugins/upload/CloudApp.pm;
sudo chmod a+x /usr/share/shutter/resources/system/upload_plugins/upload/CloudApp.pm;
```

## Get lid status
```
grep -Fxq "open" /proc/acpi/button/lid/LID/state
```

## Lock Screen On Sleep/Suspend
```
sudo nano /etc/systemd/system/i3lock.service
```

```
[Unit]
Description=User suspend actions
Before=sleep.target

[Service]
User=elliott
Type=forking
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock -i /home/elliott/Pictures/Lockscreens/bsod10.png

[Install]
WantedBy=sleep.target
```

```
$ systemctl enable i3lock.service
```

```
#!/bin/bash

icon="$HOME/.config/i3/lock.png"
img="$HOME/.cache/i3lock.png"

# Take a screenshot for our background
scrot $img
# Pixelate the background
convert $img -scale 10% -scale 1000% $img
# Add the lock-icon
convert $img $icon -gravity center -composite $img
# Finally run i3lock itself
i3lock -u -i $img
```

# Packages installed after OS install

comm -13 \
  <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort) \
  <(comm -23 \
    <(dpkg-query -W -f='${Package}\n' | sed 1d | sort) \
    <(apt-mark showauto | sort) \
  )

apt-transport-https
curl
feh
gdebi
git
gksu
google-chrome-stable
gtk-chtheme
i3
i3lock
intel-microcode
j4-dmenu-desktop
leafpad
libapache2-mod-php7.1
libpng-dev
lxappearance
mariadb-server
nginx
numix-blue-gtk-theme
numix-icon-theme
openssh-server
p7zip-rar
php7.1-pgsql
php7.1-sqlite3
php7.1-xml
php-cli
php-fpm
php-mbstring
php-mysql
php-xml
qt4-qtconfig
scrot
smartgit
sublime-text
synaptic
vlc
wicd-gtk
xbacklight
xfce4-goodies