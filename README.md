# 视频下载与处理工具

## 简介

视频下载工具，docker容器安装，省去自己部署单独软件的繁琐。

DockerFile是构建的具体步骤

## 下载image镜像

### 方式一：基于DockerFile构建

```shell
docker build -t video:v1 -f DockerFile .
```

### 方式二：从docker官网拉取镜像

[Docker 拉取镜像 https://hub.docker.com/r/modongxiao/video](https://hub.docker.com/r/modongxiao/video)

## 运行 docker run

```shell
# -v 目录映射
# --rm 运行结束后删除
# -it 运行后直接进入容器
docker run --rm -it -v [本机目录]:[容器目录] 【video:image 镜像版本】 bash
```

## 支持的列表以及github地址信息

### python you-get

[github: https://github.com/soimort/you-get](https://github.com/soimort/you-get)

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
