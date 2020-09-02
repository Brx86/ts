https://my.racknerd.com/clientarea.php?action=productdetails&id=24562

vps测速
bash <(curl -Lso- https://git.io/superspeed)

IP Address: 208.64.228.13
Username: root
#Root Password: uQjQy6tyPd3ZF3765L
Root Password: w
Username: vmuser16948
Password: d89f5feeaf 
VNC：104.194.254.100:6056
Passwd: 114514

===================================================

 ShadowsocksR账号 配置信息：

 I  P       : 47.242.0.103
 端口       : 2333
 密码       : doub.io
 加密       : aes-128-ctr
 协议       : auth_sha1_v4
 混淆       : plain
 设备数限制 : 0(无限)
 单线程限速 : 0 KB/S
 端口总限速 : 0 KB/S

 SSR   链接 : ssr://NDcuMjQyLjAuMTAzOjIzMzM6YXV0aF9zaGExX3Y0OmFlcy0xMjgtY3RyOnBsYWluOlpHOTFZaTVwYnc 
 SSR 二维码 : http://doub.pw/qr/qr.php?text=ssr://NDcuMjQyLjAuMTAzOjIzMzM6YXV0aF9zaGExX3Y0OmFlcy0xMjgtY3RyOnBsYWluOlpHOTFZaTVwYnc 
 
  提示: 
 在浏览器中，打开二维码链接，就可以看到二维码图片。
 协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。


ShadowsocksR账号 配置信息：

 I  P       : 208.64.228.13
 端口       : 80
 密码       : aya
 加密       : aes-128-ctr
 协议       : auth_sha1_v4
 混淆       : plain
 设备数限制 : 2
 单线程限速 : 0 KB/S
 端口总限速 : 0 KB/S

 SSR   链接 : ssr://MjA4LjY0LjIyOC4xMzo4MDphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6cGxhaW46WVhsaA
 SSR 二维码 : http://doub.pw/qr/qr.php?text=ssr://MjA4LjY0LjIyOC4xMzo4MDphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6cGxhaW46WVhsaA

  提示:
 在浏览器中，打开二维码链接，就可以看到二维码图片。
 协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。

ShadowsocksR账号 配置信息：

I  P       : 116.62.61.76
端口       : 2333
密码       : aya
加密       : none
协议       : origin
混淆       : plain
设备数限制 : 0(无限)
单线程限速 : 0 KB/S
端口总限速 : 0 KB/S
SS    链接 : ss://bm9uZTpheWFAMTE2LjYyLjYxLjc2OjIzMzM
SS  二维码 : http://doub.pw/qr/qr.php?text=ss://bm9uZTpheWFAMTE2LjYyLjYxLjc2OjIzMzM
SSR   链接 : ssr://MTE2LjYyLjYxLjc2OjIzMzM6b3JpZ2luOm5vbmU6cGxhaW46WVhsaA
SSR 二维码 : http://doub.pw/qr/qr.php?text=ssr://MTE2LjYyLjYxLjc2OjIzMzM6b3JpZ2luOm5vbmU6cGxhaW46WVhsaA

 提示:
在浏览器中，打开二维码链接，就可以看到二维码图片。
协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。

wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

caddy ssr 伪装443
https://os.51cto.com/art/202007/622174.htm?pc
https://www.svlik.com/384.html

本来也是来这里找SSTAP规则编写方法的，不过没有找到。经过测试研究后总算弄清楚了，看到很多网友也在找规则编写教程，在这里分享给有需要的人。
注：我用的是1.1.0.1，其它版本的应该 是通用的。
一，启动程序后，点模式最后边的小按扭，附件中的图1，打开规则管理器
二，在规则管理器中点‘添加’，新建一个规则
三，最关键的就是这个新建规则这里，很多人不会填写。（图3）
这里我以代理www.ip.cn为例来说明如何填写
English name of rule: 这里随便填一个规则英文名，我填了“ip.cn”
Chinese name of rule: 这里填一个规则中文名，我填了”ip.cn”
Proxify DNS Request：这里 Auto就行了
Action Type: 这个最重要，如果你是想代理某个（或者某段IP)就选”Proxify”，如果你是想某些IP或者某段IP跳过代理也就是直连，那么就选Direct.  当然这里我们要选Proxify
Remarks：这里随便填个备注就行了
最后是下边的Rules list: 这里也是很关键 的大家不会填
因为我想代理www.ip.cn所以我先 PING http://www.ip.cn 得到IP地址是：198.41.215.99，这里可能大家PING到的地址不相同，我用的8.8.8.8的DNS，所以ping出来的是国外的IP地址
得到这个IP到底要怎么填入进去了，如果我只想代理这个IP那么就写：198.41.215.99/32
当然很多时候只代理一个具体IP可能不会生效，因为有时候域名PING到的IP可能会变化。
所以这里写198.41.215.0/24会比较保险
那个IP后边的/32, /24到底是什么意思呢？我们应该 怎么填呢，其实这是一个网段的表示方法，后边的/32, /24是掩码
198.41.215.99/32意思是仅有一个IP地址 198.41.215.99
198.41.215.0/24 的意思是 198.41.215.1 – 198.41.215.254 一共254个IP地址
198.41.0.0/16 的意思就是 198.41.0.1 – 198.41.255.254 一共65534个IP地址
一般情况下，你如果要代理某个IP地址，直接将这个IP地址将这个IP地址最后一位写成0（数字0）再加上/24就可以了
再宽一点将后2个IP位写成0，再加/16就可以了，建议最好不要将IP后3位都写0再加/8这样所表示的IP范围就太宽了，就可能导至代理了本来不想代理的IP了。
其实搞清楚后是不是觉得写规则好简单？
例如你要代理8.8.8.8，那么将最后一位写成0再加/24那就是：8.8.8.0/24写在SSTAP中就可以了
三，填写好这些信息后，保存，选中刚才添加的代理规则，点连接就可以了。这里一定要记得切换规则再连接哦，否则不会生效的。
连接后再打开www.ip.cn看到已经是代理的IP了
关于大家都在问的最新版如何加上代理全局的功能，其实也可以通过添加规则来做到的，我抽空再做一个教程教大家吧。
 

https://opsqa.com/archives/578
