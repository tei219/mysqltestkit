FROM centos:8

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/* && \
    sed -i s@^mirrorlist@#mirrorlist@g /etc/yum.repos.d/CentOS-Linux-*.repo && \
    sed -i s@^#baseurl=http://mirror@baseurl=https://vault@g /etc/yum.repos.d/CentOS-Linux-*.repo && \
    dnf clean all && dnf update -y && \
    dnf install -y openssh-server tmux && \
    systemctl enable sshd && \
    useradd sam && \
    echo "sam:sam" | chpasswd && \
    ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key && \
    sed -i "s@^account\s*required\s*pam_nologin@account optional pam_nologin@g" /etc/pam.d/sshd /etc/pam.d/login && \
    sed -i "s@^session\s*required\s*pam_loginuid@session optional pam_loginuid@g" /etc/pam.d/sshd /etc/pam.d/login && \
    rm /run/nologin

COPY ./centos/docker-entrypoint.sh .

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]

ENTRYPOINT ["/docker-entrypoint.sh"]