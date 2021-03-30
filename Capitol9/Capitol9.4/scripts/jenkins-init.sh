#!/bin/bash

set -ex

vgchange -ay

DISC_ADITIONAL=`blkid -o value -s TYPE ${DEVICE} || echo ""`
if [ "`echo -n $DISC_ADITIONAL`" == "" ] ; then
  # wait for the device to be attached
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DISCT_EXISTA=''
  while [[ -z $DISCT_EXISTA ]]; do
    echo "Verificare $DEVICENAME"
    DISCT_EXISTA=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DISCT_EXISTA != "1" ]]; then
      sleep 15
    fi
  done
  pvcreate ${DEVICE}
  vgcreate telacad ${DEVICE}
  lvcreate --name volume1 -l 100%FREE telacad
  mkfs.ext4 /dev/telacad/volume1
fi

mkdir -p /var/lib/jenkins
echo '/dev/telacad/volume1 /var/lib/jenkins ext4 defaults 0 0' >> /etc/fstab
mount /var/lib/jenkins

# Instalam default-jre (needed for ubuntu 18.04)
apt-get update
apt-get install -y default-jre

# install jenkins and docker
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get install -y jenkins=${VERSIUNE_JENKINS} unzip docker.io

# enable docker and add perms
usermod -G docker jenkins
systemctl enable docker
service docker start
service jenkins restart

# clean up
apt-get clean

