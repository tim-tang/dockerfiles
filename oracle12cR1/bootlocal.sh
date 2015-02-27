#!/bin/sh
# put other system startup commands here
ln -s  /c/Users/jiltang/dmtws /home/docker/dmtws
sudo mkdir -p /registryhub
sudo mount -t vboxsf registryhub /registryhub
