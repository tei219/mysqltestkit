FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y openssh-server tmux && \
    mkdir /var/run/sshd && \
    useradd sam && \
    echo "sam:sam" | chpasswd

COPY ./ubuntu/docker-entrypoint.sh .

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/sbin/init"]