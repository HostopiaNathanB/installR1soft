#!bin/bash

cat > /etc/yum.repos.d/r1soft.repo << EOF
[r1soft]
name=R1Soft Repository Server
baseurl=http://repo.r1soft.com/yum/stable/\$basearch/
enabled=1
gpgcheck=0
EOF

yum clean all

cat /etc/yum.repos.d/r1soft.repo

yum install serverbackup-enterprise-agent -y

yum install -y kernel-headers-$(uname -r)

if [[ $? != "0" ]]
  then
     if [[ $(rpm -qa kernel-headers) == $(echo kernel-headers-$(uname -r)) ]]
     then echo "kernel-headers is already installed"
     else
  echo "Couldn't install Kernel-headers-$(uname -r) Please continue manually"
  exit
  fi
fi

yum install -y kernel-devel-$(uname -r)
if [[ $? != "0" ]]
  then
     if [[ $(rpm -qa kernel-devel) == $(echo kernel-devel-$(uname -r)) ]]
      then echo "kernel-devel is already installed"
      else
  echo "Couldn't install Kernel-devel-$(uname -r) Please continue manually"
  exit
  fi
fi

r1soft-setup --get-module

echo "######## R1Soft Install Done #########"
