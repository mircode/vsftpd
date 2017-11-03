######################
# 一、创建sftp目录用于上传下载
######################
mkdir /sftp
groupadd sftp

######################
# 二、修改 sshd_config文件
######################
vi /etc/ssh/sshd_config
## 注释
#Subsystem      sftp    /usr/libexec/openssh/sftp-server

## 文件末尾追加(否则报错)
Subsystem sftp internal-sftp
Match Group sftp
ChrootDirectory /sftp/%u
ForceCommand internal-sftp
AllowTcpForwarding no
X11Forwarding no

######################
# 三、创建上传下载用户
######################
# 添加用户user1
useradd -d /sftp/user1 -g sftp -s /bin/false user1
passwd user1

# 修改用户目录属主和权限
chown  root /sftp/user1
chmod  755  /sftp/user1


######################
# 四、测试
######################
service sshd restart
sftp user1@localhost