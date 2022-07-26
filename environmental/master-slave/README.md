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

$ for i in 1 2 3; do docker-compose run --rm mysql -u root -h master-slave_slave_$i -se "show slave status\G" | grep Yes; done
Creating master-slave_mysql_run ... done
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
Creating master-slave_mysql_run ... done
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
Creating master-slave_mysql_run ... done
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
```

# 既知のバグ
