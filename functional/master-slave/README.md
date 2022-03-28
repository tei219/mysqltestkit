# master-slave

# なにこれ
docker-compose up -d で レプリケーション構成の MySQL ができるやつ

# 使い方
普通にupすれば出来上がります
```sh
$ docker-compose up -d --scale slave=2
```

各インスタンスにログインする時は同梱の mysql から繋いでください
```sh
$ docker-compose run mysql -u root -p -h コンテナ名
```

# 実行例
```sh
$ docker-compose up -d --scale slave=3
Starting master ... done
Starting master-slave_slave_1 ... done
Creating master-slave_slave_2 ... done
Creating master-slave_slave_3 ... done

$ docker-compose run mysql -h master-slave_slave_3 -e "select @@hostname;"
Creating master-slave_mysql_run ... done
+--------------+
| @@hostname   |
+--------------+
| a0c093a40a9b |
+--------------+
```

# 既知のバグ
