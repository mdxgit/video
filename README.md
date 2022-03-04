# 视频下载与处理工具

## 简介

视频下载工具，docker容器安装，省去自己部署单独软件的繁琐。

DockerFile是构建的具体步骤

## 下载image镜像

### 方式一：基于Dockerfile构建

```shell
docker build -t video:v1 .
```

### 方式二：从docker官网拉取镜像

[Docker 拉取镜像 https://hub.docker.com/r/modongxiao/video](https://hub.docker.com/r/modongxiao/video)

## 运行 docker run

```shell
# -v 目录映射
# --rm 运行结束后自动删除容器
# -it 运行后直接进入容器
docker run --rm -it -v [本机目录]:[容器目录] 【video:image 镜像版本】 bash
```

## 配置 clash 代理工具,访问外网时需要，国内网络不用配置

[github: https://github.com/Dreamacro/clash](https://github.com/Dreamacro/clash)

[bin https://github.com/Dreamacro/clash/releases](https://github.com/Dreamacro/clash/releases)

### 配置 config.yaml，启动与停止 nohup

```shell
# 购买代理服务，得到 clash 的 config.yaml 配置文件
# 配置到 /root/.config/clash/config.yaml
wget 【config.yaml网络链接url】 -O /root/.config/clash/config.yaml

# 启动 输入命令后回车两次
nohup clash &

# 配置 export 就可以正常访问外网
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# 查看运行状态
root@f015572fb0ef:~/.config/clash# ps -aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0   5992  3744 pts/0    Ss   09:38   0:00 bash
root        43  4.1  0.2 712920 14660 pts/0    Sl   09:46   0:00 clash
root        54  0.0  0.0   8828  3260 pts/0    R+   09:47   0:00 ps -aux

# 查看监听的端口 ss -tnl
root@f015572fb0ef:~/.config/clash# ss -tnl
State                         Recv-Q                        Send-Q                                                Local Address:Port                                                 Peer Address:Port                        Process                        
LISTEN                        0                             4096                                                      127.0.0.1:7890                                                      0.0.0.0:*                                                          
LISTEN                        0                             4096                                                      127.0.0.1:7891                                                      0.0.0.0:*                                                          
LISTEN                        0                             4096                                                      127.0.0.1:7892                                                      0.0.0.0:*                                                          
LISTEN                        0                             4096                                                              *:9090                                                            *:* 

# 停止 kill
# 一: 停止对应的PID
kill 43
# 二：正则匹配删除
kill $(ps -aux|grep clash| grep -v grep | awk '{print $2}')
```

## 支持的列表以及github地址信息

### python you-get

[github: https://github.com/soimort/you-get](https://github.com/soimort/you-get)

```shell
# 帮助命令
you-get --help

# 查看待下载视频信息
you-get -i url

# 下载
you-get url

# 使用火狐浏览器的 cookies.sqlite
you-get -c cookies.sqlite  url
```

### go lux

[github: https://github.com/iawia002/lux](https://github.com/iawia002/lux)

[bin文件：https://github.com/iawia002/lux/releases](https://github.com/iawia002/lux/releases)

备注： annie重命名为lux

### youtube-dl

[github: https://github.com/ytdl-org/youtube-dl](https://github.com/ytdl-org/youtube-dl)

### ykdl YouKuDownLoader

[github: https://github.com/xyuanmu/ykdl](https://github.com/xyuanmu/ykdl)

[网站 https://github.com/SeaHOH/ykdl](https://github.com/SeaHOH/ykdl)

### go kkdai/youtube

[github: https://github.com/kkdai/youtube](https://github.com/kkdai/youtube)

[bin 文件：https://github.com/kkdai/youtube/releases](https://github.com/kkdai/youtube/releases)

备注： [原github废弃 https://github.com/rylio/ytdl](https://github.com/rylio/ytdl)

### ffmpeg

[github: https://github.com/FFmpeg/FFmpeg](https://github.com/FFmpeg/FFmpeg)

### 视频播放 mpv

[官网 https://mpv.io/](https://mpv.io/)

[github: https://github.com/mpv-player](https://github.com/mpv-player)

## 火狐浏览器 cookies.sqlite

### windows

### mac

```shell
# 家目录
cd ~/Library/Application\ Support/Firefox/Profiles/
# [文件名].default-release
```

![01.png](https://raw.githubusercontent.com/mdxgit/video/main/img/01.png)


