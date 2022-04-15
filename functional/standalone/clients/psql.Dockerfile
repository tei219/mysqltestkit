FROM alpine

RUN apk add postgresql-client

ENTRYPOINT ["/usr/bin/psql"]
