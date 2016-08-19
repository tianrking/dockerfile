FROM ubuntu:14.04
MAINTAINER Tianrking <tian.r.king@gmail.com>
ENV REFRESHED_AT 2016-08-16
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install python3 -y \
    && apt-get install python -y \
    && apt-get install git -y \
    && apt-get install libnet1-dev -y\
    && apt-get install wget -y \
    && apt-get install libpcap0.8-dev -y \
    && git clone -b manyuser https://github.com/breakwa11/shadowsocks.git \
    && cd shadowsocks/shadowsocks \
    && chmod 777 server.py \
    && wget https://github.com/snooda/net-speeder/archive/master.zip \
    && apt-get install unzip -y \
    && unzip master.zip \
    && cd master \
    && sh build.sh -DCOOKED \
    && sh build.sh \
    && nohup ./net_speeder venet0 "ip" & \
    && nohup ./net_speeder eth0 "ip" & \
    && cd ../ \
EXPOSE 8388
RUN python server.py -d start
