FROM ubuntu

RUN apt-get update && \
    apt-get install -y init openssh-server mysql-client && \
    systemctl enable ssh && \
    useradd sam && \
    echo "sam:sam" | chpasswd

ENTRYPOINT ["/sbin/init"]