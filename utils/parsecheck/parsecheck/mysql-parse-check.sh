#!/bin/bash

set -fu

stmt="$@"
if [[ ${stmt: -1} == ";" ]];then
    stmt="${stmt:-1}"
fi

echo "--------"
echo "stmt: \"$stmt\""
echo "--------"

for instance in mysql80 mysql57 mysql56
do
    ver=$(mysql -h $instance -sNe "select @@version;")
    if [[  $instance == "mysql80" ]]; then
        mysql -h $instance -sNe "select STATEMENT_DIGEST_TEXT('$stmt');" mysql 2>parseerror.log 1>/dev/null
    else
        mysql -h $instance -sNe "explain $stmt;" mysql 2>parseerror.log 1>/dev/null
    fi
    if [[ ! -z parseerror.log ]]; then
    echo "MySQL $ver: $(cat parseerror.log)"
    fi
done