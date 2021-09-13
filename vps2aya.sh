#!/usr/bin/bash
#Auther: Ayatale

latest=`curl -s https://mirrors.bfsu.edu.cn/lxc-images/images/archlinux/current/amd64/default/|grep -o 'href=".*/" '|awk -F\" '{print $2}'|tail -n1`
echo "正在下载$latest的容器镜像..."
wget -q --show-progress https://mirrors.bfsu.edu.cn/lxc-images/images/archlinux/current/amd64/default/${latest}rootfs.tar.xz -P /tmp/archfs/
cd /tmp/archfs/
echo '正在解压rootfs.tar.xz...'
tar xf rootfs.tar.xz
rm rootfs.tar.xz
echo '正在设置pacman.conf mirrorlist resolv.conf...'

cat > /tmp/archfs/etc/pacman.conf <<- AYA
[options]
HoldPkg     = pacman glibc
Architecture = auto
#IgnorePkg   =
#IgnoreGroup =
#UseSyslog
Color
#NoProgressBar
CheckSpace
#VerbosePkgLists
ParallelDownloads = 5
ILoveCandy
SigLevel    = Never
LocalFileSigLevel = Never
[core]
Include = /etc/pacman.d/mirrorlist
[extra]
Include = /etc/pacman.d/mirrorlist
[community]
Include = /etc/pacman.d/mirrorlist
[multilib]
Include = /etc/pacman.d/mirrorlist
AYA

cat > /tmp/archfs/live.sh <<- LIVE
cat > /root/setup.sh <<- SETUP
#!/usr/bin/bash
#Auther: Ayatale
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo aya-ali > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "127.0.0.1 aya-ali" >> /etc/hosts
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable dhcpcd
systemctl enable sshd
cat > /etc/systemd/network/dhcp.network <<- DHCP
[Match]
Name=ens3
[Network]
DHCP=ipv4
[DHCPv4]
UseHostname=false
DHCP
useradd aya -m -G wheel
echo "请设置root密码:"
passwd
echo "请设置aya密码:"
passwd aya
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
mkdir /home/aya/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDB/Hfn+8P9nveMHUSjaJxsJZuiZ7qdfqz9P8K2pYRAskBqkq7/Q7iL/he5ALas0B9UR0oYUPVCmRxBSJ1hci+nZtIjvJqQKcygSGCVvD19Velb6EwMLTP1uCfmkb+4WgcrU9OHBP/qqf3pIHhJolN2o+6c5iQFPkOHfMCkg4XiN14JolUQ/0Q62BH8XlWUisLuv/a0LKsI0jKTQ5RikVD02+g7eoE9e2Db7asqzPUnLknT8MpLcXOemV7/1EJM8cKRQCwRTbOpTPBfNTU7llGXSBn/HNIa58plIt4mOedrNROasIXyYtoLNJ/ij6xaoavrMXoWzG+54NYvLceIlm8uzeletJjO5npaAOhl5i7LnbO9epiYR0owEUY96RCmW1AO/5oC3RbsTttY8EWl2eGsJolrtJ9CYqP96MZoOAYUZYvkFvEVpN8HmtJGNOE5UuxbMkiRLzSGvciF00bYrgmaLGZSRk292jn7w+OU2DFYqWF3cCbMlj/yZqE/sqZC40M= 1124852137@qq.com" > /home/aya/.ssh/authorized_keys
chown aya -R /home/aya/.ssh
grub-install /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg
SETUP
echo '正在挂载/dev/vda1...'
mount /dev/vda1 /mnt
cd /mnt
echo '正在删除原系统...'
rm -rf bin boot etc home mnt opt root sbin srv usr var vml* ini* lib* med*
echo '开始安装Archlinux...'
pacstrap /mnt base base-devel linux-lts linux-firmware nano dhcpcd openssh grub
echo '生成fstab...'
genfstab -U /mnt >> /mnt/etc/fstab
umount /etc/resolv.conf
echo '即将进入Archliux...'
arch-chroot /mnt bash < /root/setup.sh
LIVE

rm /tmp/archfs/etc/resolv.conf
echo 'Server = http://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch' > /tmp/archfs/etc/pacman.d/mirrorlist
echo 'nameserver 114.114.114.114' > /tmp/archfs/etc/resolv.conf
echo '即将进入live系统...'
mount --bind /tmp/archfs /tmp/archfs
/tmp/archfs/bin/arch-chroot /tmp/archfs/ bash < /tmp/archfs/live.sh
echo '安装完成，3秒后重启...'
reboot
