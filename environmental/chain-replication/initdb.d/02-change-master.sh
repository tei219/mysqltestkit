#!/bin/sh

export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}

if [ ! -z ${MYMASTER} ]; then
	mysql -u root -h ${MYMASTER} -sNe "show master status\G" | \
	awk '
		NR==2{fn=$1}
		NR==3{pos=$1}
		END{
			print "change master to master_host=\047'${MYMASTER}'\047, master_user=\047repl\047, master_password=\047repl\047, master_log_file=\047"fn"\047, master_log_pos="pos"; start slave;"
			}
		' | tee /tmp/change_master.sql | mysql -u root mysql
fi