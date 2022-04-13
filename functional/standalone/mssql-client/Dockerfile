FROM ubuntu

RUN apt update && apt install -y curl gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list && \
    apt update && \
    ACCEPT_EULA=y apt install -y mssql-tools unixodbc-dev

ENTRYPOINT ["/opt/mssql-tools/bin/sqlcmd"]
