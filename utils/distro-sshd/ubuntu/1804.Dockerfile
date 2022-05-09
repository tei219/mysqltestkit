FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y init openssh-server tmux && \
    systemctl enable ssh && \
    useradd sam && \
    echo "sam:sam" | chpasswd

ENTRYPOINT ["/sbin/init"]