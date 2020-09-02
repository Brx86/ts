下载安装git（官网下载太慢，我在蓝奏云放了个旧版本，能用就行）
https://lanzous.com/id3bble

关于pip与conda换源：
win+R 打开用户目录%HOMEPATH%，在此目录下创建 pip 文件夹，在 pip 目录下创建 pip.ini 文件, 内容如下
[global]
timeout = 6000
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host = pypi.tuna.tsinghua.edu.cn

win+R 打开用户目录%HOMEPATH%，在此目录下修改.condarc文件，内容如下

channels:
  - defaults
show_channel_urls: true
channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud


最近在某世界最大同性交友网站上发现一个有意思的项目，可以把平面图片转换成视频，下面我们先看看效果

接下来就是配置的教程了，要认真听讲啊

1.从github上克隆该项目
    关于如何安装git以及克隆项目请自行百度，
    这里直接在一个文件夹下运行命令
    git clone https://github.com/vt-vl-lab/3d-photo-inpainting
    接下来请耐心等待，这里我已经下载好了，所以跳过

2.根据github上的说明配置运行环境
    基础环境：anaconda3/miniconda3
    其中最重要的就是conda命令，关于anaconda或miniconda如何安装请自行百度，这里由于是arch系的linux，可以直接从aur安装miniconda3
    安装后按照说明配置好运行环境
    conda create -n 3DP python=3.7 anaconda
    conda activate 3DP
    pip install -r requirements.txt
    conda install pytorch==1.4.0 torchvision==0.5.0 cudatoolkit==10.1.243 -c pytorch
    由于我已经用conda创建过"3DP"的环境了，这里换个3DP_的名字演示一下
    因为我之前已经下载过这些包了，所以这里安装的速度很快，实际上由于网速与电脑性能的原因这一步可能需要相当久的时间，请耐心等待
    （pip和conda记得换源，教程百度一下都有，要不然可能得下载一年）
    
3.下载深度学习模型文件
    官方的说明是使用download.sh脚本下载，
    但实际上外网的文件下载速度极慢，几乎不可能直接下载
    这里我把下载完成的文件打包放在这了，想要的直接wget下载就行
    下载失败的多试几次
    http://ayatale.xyz:5/directlink/5/pt.zip
    查看download.sh和压缩包的内容，
    把压缩包内的四个文件放到对应的位置

4.根据电脑GPU修改argument.yml文件
    如果你对自己电脑的GPU十分自信的话请跳过这一步，
    否则请将argument.yml文件里的gpu_ids一项改成-1，使用纯CPU计算

5.放入图片，根据图片格式修改argument.yml，在项目路径下运行命令
    图片目录为image文件夹，
    格式支持jpg，jpeg，png格式，其他格式暂未测试过
    conda activate 3DP
    python main.py --config argument.yml
    注意右侧内存与CPU占用
    推荐内存16G以上（纯CPU计算），显存6G以上（纯GPU计算）
    内存不够的自己加上虚拟内存或交换空间防止电脑卡死
    完美！接下来看一下视频效果
    到这一步你已经成功运行了这个项目，
    接下来怎么用看你发挥（手动滑稽）
