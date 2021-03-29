#!/bin/bash

# asteptam pana instanta este pregatita
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# instalam nginx
apt-get -y install nginx

# ne asiguram ca a pornit cu success
service nginx start
