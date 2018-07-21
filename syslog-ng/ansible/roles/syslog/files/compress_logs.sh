#!/bin/bash
#
# ** File managed by Puppet **
#
# compress yesterday's daily logs on the syslog server
#
YEAR=`/bin/date --date=yesterday +%Y`
MONTH=`/bin/date --date=yesterday +%m`
DAY=`/bin/date --date=yesterday +%d`

/bin/ls -1 /var/log/HOSTS/*/$YEAR/$MONTH/$DAY/*-$YEAR$MONTH$DAY | /usr/bin/xargs /usr/bin/bzip2 -v

