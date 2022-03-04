FROM python:3.9-bullseye

# 基于python docker构建
# docker python: https://hub.docker.com/_/python?tab=tags
# 构建command
# docker build -t modongxiao/video:1.0 .

# 解压复制文件
COPY ./package /tmp/package

RUN set -e \
# 华为镜像：https://mirrors.huaweicloud.com/home
&& sed -i "s@http://ftp.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list \
&& sed -i "s@http://security.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list \

# update
&& rm -rf /etc/apt/sources.list.d/* \
&& apt-get install apt-transport-https ca-certificates \
&& apt-get clean all && apt-get -y update \
# 基础组件
&& apt-get -y install gnupg1 gnupg2 inetutils-ping iproute2 \

# 升级 python
&& /usr/local/bin/python -m pip install --upgrade pip \

# 安装 go
# apt-get -y install golang-go
# echo "export GOPATH=$HOME/go" >> $HOME/.bash_profile
# source $HOME/.bash_profile

# you-get
&& pip3 install you-get \

# 安装 lux
&& cd  /tmp/package/ && tar -zxvf lux_0.13.0_Linux_64-bit.tar.gz -C /usr/local/bin/ && chmod +x /usr/local/bin/lux \

# 安装 youtube-dl
&& apt-get -y install youtube-dl \

# 安装 ffmpeg
&& apt-get -y install ffmpeg \

# 安装 ykdl
&& pip3 install ykdl \

# kkdai/youtube
&& cd  /tmp/package/ && mkdir youtubedr_2.7 \
&& tar -zxvf youtubedr_2.7.10_linux_amd64.tar.gz -C ./youtubedr_2.7 \
&& mv ./youtubedr_2.7/youtubedr /usr/local/bin/youtubedr \
&& chmod +x /usr/local/bin/youtubedr && rm -rf ./youtubedr_2.7 \

# 安装 clash 代理
&& cd  /tmp/package/ && gunzip clash-linux-amd64-v1.9.0.gz \
&& mv clash-linux-amd64-v1.9.0 /usr/local/bin/clash \
&& chmod +x /usr/local/bin/clash \
&& mkdir -pv /root/.config/clash

# 启动时的命令
CMD ["python3"]
