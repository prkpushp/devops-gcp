#!/bin/bash

apt-get update

apt-get install -y ${package_name}

systemctl enable ${package_name}
systemctl start ${package_name}

echo "${welcome_message}" > /var/www/html/index.html
