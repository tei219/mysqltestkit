FROM centos:6

RUN sed -i s@^mirrorlist@#mirrorlist@g /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i s@^#baseurl=http://mirror@baseurl=https://vault@g /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && yum update -y && \
    yum install -y openssh-server tmux && \
    useradd sam && \
    echo "sam:sam" | chpasswd

ENTRYPOINT ["/sbin/init"]