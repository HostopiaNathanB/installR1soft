!#bin/bash

cat > /etc/yum.repos.d/r1soft.repo << EOF
[r1soft]
name=R1Soft Repository Server
baseurl=http://repo.r1soft.com/yum/stable/$basearch/
enabled=1
gpgcheck=0
EOF

yum clean all

cat /etc/yum.repos.d/r1soft.repo

yum install serverbackup-enterprise-agent -y

yum install -y kernel-devel-$(uname r)

r1soft-setup --get-module

echo "######## R1Soft Install Done #########"
