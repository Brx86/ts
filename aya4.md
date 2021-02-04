**arco镜像站**  https://bike.seedhost.eu/arcolinux/iso/

**vbox隐藏菜单栏：**
HostKey + Home

**win精简版** https://www.winos.me/windows10/

**浏览器P2Pxprofile** http://pplink.link/

**火萤动态壁纸** http://bbs.huoying666.com/forum-53-1.html  

**默认zsh** ```sudo chsh -s /bin/zsh```

**flv/mkv -> mp4**  ```ffmpeg -i "xxx.mkv" -vcodec copy -acodec copy "xxx.mp4"```

**xp https qq安装不安全** KB931125-rootsupd https://zhidao.baidu.com/question/1371411766700718419.html 

**Arch镜像站**
```
Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.huaweicloud.com/archlinux/$repo/os/$arch
Server = https://mirrors.cloud.tencent.com/archlinux/$repo/os/$arch
Server = http://mirrors.163.com/archlinux/$repo/os/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```
```
[archlinuxcn]
SigLevel = Never
Server =  https://mirrors.bfsu.edu.cn/archlinuxcn/$arch
#Server = https://mirrors.cloud.tencent.com/archlinuxcn/$arch
#Server = http://mirrors.163.com/archlinux-cn/$arch
#Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
#Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
```

**netease网易云音乐中文**  https://gitee.com/sakura99/netease-cloud-music_For_Arch

**nvidia 显卡**  
prime方案  https://blog.sakuya.love/archives/linuxgpu/  
optimus方案  https://tieba.baidu.com/p/6340530678
```
sudo pacman -S nvidia bbswitch optimus-manager-qt lib32-nvidia-utils 
```
**Office onedrive**  https://www.office.com/?auth=2  

**VMware**  https://blog.csdn.net/qq_44090577/article/details/94434578

**临时关闭IPV6** 
```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
```
**deepin-wine缺少某libcurses5** ```sudo pacman -S archlinuxcn/lib32-ncurses5-compat-libs```

**deepin-wine更改缩放**
```env WINEPREFIX="$HOME/.deepinwine/Deepin-QQLight" deepin-wine winecfg```

**wps中文包**
wps-office-mui-zh-cn

**deepin-qq中文字体**
https://www.cnblogs.com/crab-in-the-northeast/p/change-chinese-font-of-deepin-wine-qq.html

~~**conky**  http://blog.sina.com.cn/s/blog_49895cf101014cw9.html~~

**Manjaro常用软件安装** https://blog.csdn.net/weixin_43968923/article/details/86662256


ArcoLinux 的安装镜像分为三种：ArcoLinux、ArcoLinuxD 及 ArcoLinuxB。ArcoLinux 默认包含三个同时存在的桌面环境或窗口管理器：Xfce、OpenBox 及 i3。用户可以在这三个桌面之间快速地切换。ArcoLinuxD 是一个最小化安装，D 代表「Choose the Desktop」，它允许用户修改安装脚本并选择自己喜好的桌面环境。ArcoLinuxB 提供了高度的可定制性，B 代表「Build Your Own ISO」。其允许用户任意修改 ISO 文件。ArcoLinuxB 也预先提供了分别配有不同桌面环境的十余种预先构建好的安装镜像。这些桌面环境包括但不限于 Cinnamon、Awesome、Bugdie、GNOME、MATE 及 Plasama。

~~**皮皮直连**~~
~~https://www.ppzhilian.com/~~

**中文字体**
```
#能用
sudo pacman -S ttf-dejavu wqy-zenhei wqy-microhei
#Adobe中文全家桶
sudo pacman -S --noconfirm adobe-source-han-serif-cn-fonts adobe-source-han-serif-tw-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts 
#谷歌中文全家桶
sudo pacman -S --noconfirm noto-fonts-cjk noto-fonts-emoji noto-fonts
#微软雅黑+宋体
sudo pacman -U (path)/ttf-ms-win10-zh_cn-10.0.18362.116-2-any.pkg.tar.zst
#自定义ms字体 
sudo mkdir /usr/share/fonts/ms/
sudo cp /run/media/aya/71475E9362E7021C/Windows/Fonts/*.ttc /usr/share/fonts/ms/
sudo cp /run/media/aya/71475E9362E7021C/Windows/Fonts/*.ttf /usr/share/fonts/ms/
sudo chmod 766 /usr/share/fonts/ms/* &&mkfontscale&&mkfontdir&&fc-cache -fv
```

~~**搜狗拼音**  https://www.cnblogs.com/qscgy/archive/2020/07/27/13385905.html~~  
~~yay -S fcitx fcitx-configtool fcitx-sogoupinyin aur/fcitx-qt4 --noconfirm &&sudo pacman -U https://arch-archive.tuna.tsinghua.edu.cn/2019/04-29/community/os/x86_64/fcitx-qt4-4.2.9.6-1-x86_64.pkg.tar.xz && sudo pacman -S fcitx fcitx-configtool fcitx-sogoupinyin~~

**sublime3汉化** https://blog.csdn.net/Andrelia20171760/article/details/81814652?

**firefox双击关闭标签页**  
>1、浏览器打开about:config回车  
>2、在显示的搜索框输入 browser.tabs.closeTabByDblclick  
>3、双击内容，切换为true 
  
**virtualbox错误Kernel driver not installed (rc=-1908) "arch"**  
解决方法：```sudo pacman -S linux-headers virtualbox-host-modules-arch && sudo modprobe vboxdrv```  
参考[Archwiki](https://wiki.archlinux.org/index.php/VirtualBox_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

**pacman生成软件列表与恢复**
```
#生成软件包列表
pacman -Qqen > packages-repository.txt
pacman -Qqem > packages-AUR.txt
#重新安装
pacman --needed -S - < packages-repository.txt 
cat packages-AUR.txt | xargs yaourt -S --needed --noconfirm
#清除多余包
yaourt -R `pacman -Qdqt`
```

**scrcpy投屏** 
```yay -S guiscrcpy qt-scrcpy```

**xfce桌面不显示：** xfdesktop 
https://forum.ubuntu.com.cn/viewtopic.php?t=2563

**virtualbox从物理磁盘生成镜像**
```
sudo chmod 666 /dev/sdb1
sudo vboxmanage internalcommands createrawvmdk -filename /home/aya/VirtualBox VMs/rawdisk.vmdk -rawdisk /dev/sdb1 -relative
```

**3d-photo-inpainting 图片立体3D化**   
```
git clone https://gitee.com/brx86/three_photo_inpainting
pip install pyyaml pymesh networkx vispy scipy tqdm torch vispy scipy tqdm Matplotlib opencv-python moviepy scikit-image transforms3d torchvision
```

**百度tts文字转语音api** https://tts.baidu.com/text2audio?tex=文字内容&cuid=baike&lan=ZH&ctp=1&pdt=301

**tar常用命令**
```
#tar.xz压缩
tar -Jcvf xxx.tar.xz xxx
#tar.xz解压
tar -Jxvf xxx.tar.xz
#tar.gz压缩
tar -zcvf xxx.tar.gz xxx
#tar.gz解压
tar -zxvf xxx.tar.gz
```
**neofetch单文件**  https://download.fastgit.org/Brx86/brx86/releases/download/1/neofetch

**fcitx-qt5**
```
sudo pacman -S --noconfirm fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-qt4 fcitx5-configtool fcitx5-material-color fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki
```

.xprofile
```
export QT_IM_MODULE=fcitx5
export GTK_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx5 &
```

[快快升级fcitx5，新一代输入法框架](https://www.jianshu.com/p/2fdc6cc2aa8d)  
[如何现在就在 Arch Linux 用上 Fcitx 5](https://www.csslayer.info/wordpress/fcitx-dev/%e5%a6%82%e4%bd%95%e7%8e%b0%e5%9c%a8%e5%b0%b1%e5%9c%a8-arch-linux-%e7%94%a8%e4%b8%8a-fcitx-5/)

**用户对目录的权限** ```chown -R aya /home/aya```

**grub**  ```grub-mkconfig -o /boot/grub/grub.cfg```

**pacman密钥**
```
pacman-key --init
pacman-key --populate archlinux
pacman -S archlinux-keyring
pacman -S archlinuxcn-keyring
```
**jetson开启图形界面**
```
sudo systemctl set-default graphical.target #开启
sudo reboot
sudo systemctl set-default multi-user.target #关闭
sudo reboot

**chrome插件**
如需拖拽安装插件，则请在启动命令后加上 `--enable-easy-off-store-extension-install`

~~**常用软件**~~  
~~sudo pacman -S --noconfirm axel flashplugin virtualbox virtualbox-host-dkms redshift motrix-git baidunetdisk-bin wps-office ttf-wps-fonts deepin-terminal-old hmcl remmina freerdp evince steam flameshot-git baka-mplayer fsearch-git pikaur  scrcpy~~  
~~sudo pacman -S --noconfirm axel uget uget-integrator-firefox flashplugin netease-cloud-music sublime-text-imfix virtualbox virtualbox-host-dkms redshift motrix-git  baidunetdisk-bin wps-office ttf-wps-fonts wps-office-mui-zh-cn hmcl remmina freerdp evince deepin.com.qq.im steam onedrive flameshot-git baka-mplayer fsearch-git albert pikaur xfce4-clipman-plugin~~

**WSL-Ubuntu18.04 LTS 重启方法** 以管理员权限运行cmd
```
net stop LxssManager    //停止  
net start LxssManager    //启动
```
