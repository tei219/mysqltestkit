FROM ubuntu:12.04

RUN sed -i s@archive.@old-releases.@g /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y openssh-server tmux && \
    mkdir /var/run/sshd && \
    useradd sam && \
    echo "sam:sam" | chpasswd

COPY ./ubuntu/docker-entrypoint.sh .

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/sbin/init"]