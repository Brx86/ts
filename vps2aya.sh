#!/usr/bin/bash
# Auther: Ayatale

USER=aya
DNS=8.8.8.8
HOSTNAME=aya-g
MIRROR=cloudflaremirrors.com
#MIRROR=mirrors.bfsu.edu.cn

latest=`curl -s https://mirrors.bfsu.edu.cn/lxc-images/images/archlinux/current/amd64/default/|grep -o 'href=".*/" '|awk -F\" '{print $2}'|tail -n1`
echo "正在下载$latest的容器镜像..."
wget -q --show-progress https://mirrors.bfsu.edu.cn/lxc-images/images/archlinux/current/amd64/default/${latest}rootfs.tar.xz -P /tmp/archfs/
cd /tmp/archfs/
echo "正在解压rootfs.tar.xz..."
tar xf rootfs.tar.xz
rm rootfs.tar.xz
echo "正在设置pacman.conf mirrorlist resolv.conf..."

sed -i 's|#Parallel|Parallel|g' /tmp/archfs/etc/pacman.conf
sed -i 's|SigLevel|SigLevel = Never\n#SigLevel|g' /tmp/archfs/etc/pacman.conf

cat > /tmp/archfs/live.sh <<- LIVE
echo "正在挂载/dev/vda1..."
mount /dev/vda1 /mnt
cd /mnt
echo "正在删除原系统..."
rm -rf bin boot etc home mnt opt root sbin srv usr var vml* ini* lib* med*
echo "开始安装Archlinux..."
pacstrap /mnt base base-devel linux-lts linux-firmware nano dhcpcd openssh grub
echo "生成fstab..."
genfstab -U /mnt >> /mnt/etc/fstab
echo "即将进入Archliux..."
rm /mnt/etc/resolv.conf
arch-chroot /mnt /setup.sh
LIVE

cat > /setup.sh <<- SETUP
#!/usr/bin/bash
# Auther: Ayatale
echo "设置时区与网络..."
echo "nameserver $DNS" > /etc/resolv.conf
#ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
hwclock --systohc
echo $HOSTNAME > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
sed -i 's|#Parallel|Parallel|g' /etc/pacman.conf
sed -i 's|SigLevel|SigLevel = Never\n#SigLevel|g' /etc/pacman.conf
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
useradd $USER -m -G wheel
echo "设置用户aya..."
echo root:w|chpasswd
echo $USER:w|chpasswd
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
mkdir /home/$USER/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCX/5W02YgCHe6Wz8WX9RbPsy0zv/YYsSe7OMKaKqypYXoA2Q39kqaQCGqDNp3tbHRiTioIsuRQ10yEy5kWL6rUX4XOtEHjmYa31qGwvApvufb530ENeUJoo2eefEX+tHBUHQKUiV11u2mu57J99gdIIkj3T++ppwZbK4i5jDiCJVEZb1mXxIxnpnUUstj1PmrKCe/ED7U295hXvxZUM34HCsq7W8XFbfrAJx8Rc69USs1UPLFHr/wTUrbsX02rAviW5S2NXUwsCHL5k1B2/v46dQrztdeLsXp3HysXNZ01yW3sygiuCesUEqxDUS2jSVIlS7fMWKDFQbL1u0C1g346MoH4mQenWfwr+fbboFYMXQVUk2zj/G4Tma909H2XlUDklD0SE1kF9266uA5IQca24ZeZm9750S/CEfNk5Jk6TJrUm9+8YM7QmdS4LxJd2x72X115Rpk1x+d0m0JzSZDTsp1dJYuT4f9NTNA8MB4k+RuZ79atcRpTrPxjDYyZpZM= aya@Ayau" > /home/$USER/.ssh/authorized_keys
chown $USER -R /home/$USER/.ssh
echo "安装引导..."
grub-install /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg
SETUP

echo "Server = https://$MIRROR/archlinux/\$repo/os/\$arch" > /tmp/archfs/etc/pacman.d/mirrorlist
echo "nameserver $DNS" > /tmp/archfs/etc/resolv.conf
echo "即将进入live系统..."
mount --bind /tmp/archfs /tmp/archfs
chmod 777 /tmp/archfs/live.sh
chmod 777 /setup.sh
/tmp/archfs/bin/arch-chroot /tmp/archfs/ /live.sh
echo "安装完成，即将重启..."
reboot
