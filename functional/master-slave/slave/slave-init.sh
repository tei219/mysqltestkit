#!/bin/sh

if [ ! -e /etc/mysql/conf.d/server-id.cnf ]; then
	echo "[mysqld]" > /etc/mysql/conf.d/server-id.cnf
	echo "server-id = $(od -vAn -N1 -tu4 < /dev/random)" >> /etc/mysql/conf.d/server-id.cnf
fi

if [ -z "$@" ]; then
	docker-entrypoint.sh mysqld
else
	docker-entrypoint.sh "$@"
fi
