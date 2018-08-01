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
sudo nano /etc/systemd/system/lockscreen.service
```

```
[Unit]
Description=User suspend actions
Before=sleep.target

[Service]
#User=%I
User=elliott
Type=forking
Environment=DISPLAY=:0
#ExecStartPre= -/usr/bin/pkill -u %u unison ; /usr/local/bin/music.sh stop ; /usr/bin/mysql -e 'slave stop'
#ExecStart=/usr/bin/sflock
#ExecStart=/usr/bin/i3lock -c 000000
ExecStart=/usr/bin/i3lock -i /home/elliott/Pictures/Lockscreens/bsod10.png
#ExecStartPost=/usr/bin/sleep 1

[Install]
WantedBy=sleep.target
```


```
sudo nano /lib/systemd/system-sleep/lockscreen
```

```
#!/bin/sh
PATH=/sbin:/usr/sbin:/bin:/usr/bin

case $1/$2 in
  pre/*)
    echo "Going to $2..."
    # Place your pre suspend commands here, or `exit 0` if no pre suspend action required
    #DISPLAY=:0 sudo -H -u elliott bash -c 'sh /home/elliott/Apps/i3-config/scripts/lock/fuzzy_lock.sh &' &
    service lockscreen start
    #exit 0
    ;;
  post/*)
    echo "Waking up from $2..."
    # Place your post suspend (resume) commands here, or `exit 0` if no post suspend action required
    exit 0
    ;;
esac
```

```
sudo chmod +x /lib/systemd/system-sleep/lockscreen
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