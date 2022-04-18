# parsecheck

# なにこれ
構文チェックするやつ

# 使い方
parsechek でクエリを投げて確認
```sh
$ docker-compose run parsecheck "クエリ"
```
MySQL 8 は STATEMENT_DIGEST_TEXT, その他は explain で構文チェックするよ  
チェック対象は list ファイルに列挙してね

同梱の docker-compose.yml で MySQL の8.0,5.7 が上がるので確認できるよ
```sh
$ docker-compose up -d
```

# 実行例
```sh
$ docker-compose run --rm parsecheck "select sql_cache * from user"
Creating parsecheck_parsecheck_run ... done
--------
stmt: "select sql_cache * from user;"
--------
MySQL 8.0.28: ERROR 3676 (HY000) at line 1: Could not parse argument to digest function: "You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from user' at line 1".
MySQL 5.7.37: 
```

# 既知のバグ
