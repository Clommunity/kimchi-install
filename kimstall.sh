#!/bin/bash

service apache2 stop
update-rc.d apache2 remove
apt-get -y remove apache2


echo "mdadm	mdadm/initrdstart	string	all"|debconf-set-selections
apt-get -y install gettext python-cherrypy3 python-cheetah python-libvirt \
                       libvirt-bin python-imaging python-configobj \
                       python-pam python-m2crypto python-jsonschema \
                       qemu-kvm libtool python-psutil python-ethtool \
                       sosreport python-ipaddr python-ldap \
                       python-lxml nfs-common open-iscsi lvm2 xsltproc \
                       python-parted nginx python-guestfs libguestfs-tools \
                       websockify novnc spice-html5

dpkg -i kimchi-1.4.1-*.noarch.deb

cp kimchid /etc/init.d/

update-rc.d kimchid defaults
/etc/init.d/kimchid start


