#!/bin/bash

if ! grep -sqE "^vagrant" /etc/passwd ; then
    PASSWORD=$(perl -e 'print crypt('vagrant', "\$6\$");')
    sudo useradd -p ${PASSWORD} -G sudo -m -s /bin/bash vagrant
    sudo sh -c "echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-cloud-init-users-vagrant"
fi
