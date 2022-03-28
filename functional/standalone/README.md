# standalone

# なにこれ
docker の MySQL

# 使い方
デフォルトは 8.0 だけ上がるので、自分でバージョン指定してね
```sh
$ docker-compose up -d mysql56
```

各インスタンスにログインする時は同梱の mysql から繋いでね
```sh
$ docker-compose run mysql -u root -p -h コンテナ名
```

# 実行例
```sh
$ docker-compose run mysql -u root -h mysql51 -sNe "show global variables like '%version%'" mysql
Creating standalone_mysql_run ... done
protocol_version        10
version 5.1.73
version_comment MySQL Community Server (GPL)
version_compile_machine x86_64
version_compile_os      unknown-linux-gnu
```

# 既知のバグ
