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

mkdir centos7

sudo yum -y -c centos7.repo --disablerepo=* --enablerepo=centos7-chroot-base --enablerepo=centos7-chroot-epel --disableplugin=* --installroot=$TMPDIR/centos7. install \
	bash \
	bash-completion \
	vim-minimal \
	yum \
	iproute \
	iputils \
	rootfiles \
	sudo

cd BUILDIR
rm -r $TMPDIR