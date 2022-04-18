FROM alpine

RUN apk add mysql-client bash

COPY ./mysql-parse-check.sh /
COPY ./list /

ENTRYPOINT ["/mysql-parse-check.sh"]
