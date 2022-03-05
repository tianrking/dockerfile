FROM ubuntu:latest
RUN apt update && \
    apt install curl git -y

RUN curl -O  "https://gitee.com/tianrking/code-server/raw/main/install.sh" 
RUN sh install.sh

CMD PASSWORD="255=ff" code-server --bind-addr 0.0.0.0:8080
