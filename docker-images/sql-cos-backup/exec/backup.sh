#!/bin/sh
SLEEP=30
if [ "$BACKUP_INTERVAL_SEC" != "" ]; then
	SLEEP=$BACKUP_INTERVAL_SEC
fi

function backup {
	DUMPFILE="$(mktemp)"
	DATE="$(date '+%Y-%m-%d %H:%M:%S %Z')"
	echo "Start backup at $DATE"
	export MYSQL_PWD="$MYSQL_PASS"
	mysqldump -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASS" "$MYSQL_DB" \
	       	> "$DUMPFILE"
	coscli cp -c /config/cos.yaml "$DUMPFILE" "cos://bucket/sql/$DATE.sql"
	rm -rvf "$DUMPFILE"
	echo "Done backup at $DATE"
}

while true; do
	echo "Script startted, interval is $SLEEP seconds"
	backup
	echo "Done, sleep $SLEEP seconds"
	sleep $SLEEP
done

