FROM ubuntu:14.04
MAINTAINER Tianrking <tian.r.king@gmail.com>
ENV REFRESHED_AT 2016-08-16
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install python3 -y \
    && apt-get install python -y \
    && apt-get install git -y \
    && git clone -b manyuser https://github.com/breakwa11/shadowsocks.git \
    && cd shadowsocks/shadowsocks \
    && chmod 777 server.py
WORKDIR "shadowsocks/shadowsocks" 
ENTRYPOINT ["server.py"]
