FROM alpine

RUN apk add mysql-client

ENTRYPOINT ["/usr/bin/mysql"]
