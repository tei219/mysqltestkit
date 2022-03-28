# parsecheck

# なにこれ
構文チェックするやつ

# 使い方
up して各バージョンの MySQL を立ち上げます
```sh
$ docker-compose up -d
```

parsechek でクエリを投げて確認
```sh
$ docker-compose run mysql -u root -p -h コンテナ名
```
MySQL 8 は STATEMENT_DIGEST_TEXT, その他は explain で構文チェックするよ

# 実行例
```sh
$ docker-compose run parsecheck "select sql_cache * from user"
Creating parsecheck_parsecheck_run ... done
--------
stmt: "select sql_cache * from user;"
--------
MySQL 8.0.28: ERROR 3676 (HY000) at line 1: Could not parse argument to digest function: "You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from user' at line 1".
MySQL 5.7.37: 
MySQL 5.6.51: 
```

# 既知のバグ
