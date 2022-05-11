#!/bin/bash

for i in centos6 centos7 centos8 centosstream
do
  echo $i
  docker-compose up --build -d $i

  docker-compose run --rm ansible -i $i, all -m shell -a 'hostname' -u sam -e 'ansible_ssh_password=sam'

  docker-compose stop $i
  docker-compose rm -f
done