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
WIP
```

# 既知のバグ