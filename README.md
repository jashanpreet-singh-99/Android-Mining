## VNC setup

`sudo apt-get install x11vnc`

`x11vnc -storepasswd`

`x11vnc -display :0 -usepw -forever -loop -noxdamage`

### In I3 setup  add

`exec --no-startup-id x11vnc -display :0 -usepw -forever -loop -noxdamage`


## i3 setup

`sudo apt update`

`sudo apt install i3 xserver-xorg-core xinit x11-xserver-utils`

`echo "exec i3" > ~/.xinitrc`

### In .bashrc export >>
```
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
  startx
fi
```

### Startup service
`sudo nano /etc/systemd/system/i3.service`

```
[Unit]
Description=Start X and i3 Window Manager
After=graphical.target

[Service]
User=your-username
WorkingDirectory=/home/your-username
ExecStart=/usr/bin/startx
Restart=always
StandardInput=tty

[Install]
WantedBy=multi-user.target
```

`sudo systemctl enable i3.service`

`sudo systemctl start i3.service`

### Dummy for no monitor display setup
`sudo apt install xserver-xorg-video-dummy`

`sudo nano /etc/X11/xorg.conf.d/10-dummy.conf`
```
Section "Monitor"
    Identifier "DummyMonitor"
    HorizSync   28.0-80.0
    VertRefresh 48.0-75.0
EndSection

Section "Device"
    Identifier "DummyDevice"
    Driver "dummy"
    VideoRam 256000
EndSection

Section "Screen"
    Identifier "DummyScreen"
    Device "DummyDevice"
    Monitor "DummyMonitor"
    DefaultDepth 24
    SubSection "Display"
        Depth 24
        Modes "1920x1080"
    EndSubSection
EndSection
```
