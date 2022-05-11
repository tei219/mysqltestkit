FROM alpine

RUN apk add ansible openssh-client sshpass && \
    ssh-keygen -f /root/.ssh/id_rsa -t rsa -N "" && \
    echo "Host *" > ~/.ssh_config && \
    echo "HostKeyAlgorithms +ssh-rsa" >> ~/.ssh/config && \
    echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> ~/.ssh/config && \
    echo "StrictHostKeyChecking no" >> ~/.ssh/config

ENTRYPOINT ["/usr/bin/ansible"]
