#!/bin/bash

set -e
set -x

sudo echo "fs.file-max = 131072" >> /etc/sysctl.conf
sudo sysctl -p
sudo echo "* soft     nproc          131072    
* hard     nproc          131072   
* soft     nofile         131072   
* hard     nofile         131072
root soft     nproc          131072    
root hard     nproc          131072   
root soft     nofile         131072   
root hard     nofile         131072" >> /etc/security/limits.conf
sudo echo "session required pam_limits.so" >> /etc/pam.d/common-session

#return results
ulimit -n 131072
