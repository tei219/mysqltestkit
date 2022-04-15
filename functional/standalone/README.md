# standalone

# なにこれ
docker の DBコレクション

# 使い方
デフォルトは MySQL 8.0 だけ上がるので、自分で指定してね
```sh
$ docker-compose up -d mysql56
```

各インスタンスにログインする時は同梱の 各々の client  から繋いでね
```sh
$ docker-compose run --rm mysql -u root -p -h コンテナ名
$ docker-compose run --rm sqlcmd -U sa -S コンテナ名
$ docker-compose run --rm psql -U postgres -h コンテナ名
```

# 実行例
```sh
$ docker-compose up -d mysql51
Creating mysql51 ... done
$ docker-compose run mysql -u root -h mysql51 -sNe "show global variables like '%version%'" mysql
Creating standalone_mysql_run ... done
protocol_version        10
version 5.1.73
version_comment MySQL Community Server (GPL)
version_compile_machine x86_64
version_compile_os      unknown-linux-gnu

--
$ docker-compose up -d mssql2017
Creating mssql2017 ... done
$ docker-compose run --rm sqlcmd -S mssql2017 -U sa -P P@ssw0rd -Q "select @@version" -W
Creating standalone_sqlcmd_run ... done
 
-
Microsoft SQL Server 2017 (RTM-CU29) (KB5010786) - 14.0.3436.1 (X64) 
        Mar 18 2022 13:21:03 
        Copyright (C) 2017 Microsoft Corporation
        Developer Edition (64-bit) on Linux (Ubuntu 16.04.7 LTS)

(1 rows affected)

--
$ docker-compose up -d postgres10
Starting postgres10 ... done
$ docker-compose run --rm -e "PGPASSWORD=P@ssw0rd" psql -h postgres10 -U postgres -w -c "select version();"
Creating standalone_psql_run ... done
Password for user postgres: 
                                                              version                                                               
------------------------------------------------------------------------------------------------------------------------------------
 PostgreSQL 10.20 (Debian 10.20-1.pgdg90+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516, 64-bit
(1 row)
```

# 既知のバグ
