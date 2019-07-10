#!/usr/bin/env bash
localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
wget -P /tmp https://packages.chef.io/files/stable/chef/14.12.9/el/7/chef-14.12.9-1.el7.x86_64.rpm
rpm -Uvh  /tmp/chef-*.rpm
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL
# vagrant environment nodes
10.0.15.10  chef-server
10.0.15.15  lb
10.0.15.22  web2
10.0.15.23  web3
EOL
