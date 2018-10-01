#!/bin/bash

set -e
BUILDIR=$(pwd)
TMPDIR=$(mktemp -d)
cd $TMPDIR

cat > centos7.repo << EOF
[centos7-chroot-base]
name=CentOS-7-Base
baseurl=http://mirror.centos.org/centos/7/os/x86_64
gpgcheck=0

[centos7-chroot-epel]
name=Extra Packages for Enterprise Linux 7
baseurl=http://dl.fedoraproject.org/pub/epel/7/x86_64
gpgcheck=0
EOF

cat > wsl.conf << EOF
[automount]
enabled = true
options = "metadata,uid=1000,gid=1000,umask=22,fmask=11,case=off"
mountFsTab = true

[network]
generateHosts = true
generateResolvConf = true
EOF

mkdir $TMPDIR/centos7

sudo yum -y -c centos7.repo --disablerepo=* --enablerepo=centos7-chroot-base --enablerepo=centos7-chroot-epel --disableplugin=* --installroot=$TMPDIR/centos7 install bash bash-completion vim-minimal yum iproute iputils rootfiles sudo git 

sudo cp wsl.conf $TMPDIR/centos7/etc/wsl.conf

sudo chroot $TMPDIR/centos7 bash -c 'echo "export DISPLAY=:0" > /etc/profile'
sudo chroot $TMPDIR/centos7 bash -c 'echo "export LIBGL_ALWAYS_INDIRECT=1" > /etc/profile'
sudo chroot $TMPDIR/centos7 bash -c 'echo "export NO_AT_BRIDGE=1" > /etc/profile'
sudo chroot $TMPDIR/centos7 bash -c 'echo "export DISPLAY=:0" > /etc/environment'
sudo chroot $TMPDIR/centos7 bash -c 'echo "export LIBGL_ALWAYS_INDIRECT=1" > /etc/environment'
sudo chroot $TMPDIR/centos7 bash -c 'echo "export NO_AT_BRIDGE=1" > /etc/environment'
sudo chroot $TMPDIR/centos7 bash -c 'echo 7 >> /etc/yum/vars/releasever'
sudo chroot $TMPDIR/centos7 bash -c 'echo "x86_64" > /etc/yum/vars/basearch'
sudo chroot $TMPDIR/centos7 yum clean all
sudo chroot $TMPDIR/centos7 rm -rf /boot /var/cache/yum/* /tmp/ks-script* /var/log/* /tmp/* /etc/sysconfig/network-scripts/ifcfg-*
sudo chroot $TMPDIR/centos7 localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
sudo chroot $TMPDIR/centos 

sudo tar --exclude=$TMPDIR/centos7/home --exclude=$TMPDIR/centos7/var/cache/yum/* -zcvf $BUILDIR/install.tar.gz centos7 

cd $BUILDIR
rm -r $TMPDIR