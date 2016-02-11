#!/bin/bash

zone_identifier=zone_identifier
record_identifier=record_identifier
auth_key=api_key
auth_email=your_cloudflare_email
ip=backup_ip
record_name=record_name


wget -q --tries=1 --timeout=3 http://www.google.com -O /tmp/index.google >> /dev/null
if [ ! -s /tmp/index.google ];then
       echo `date` No interwebz? Not switching over! >> /root/cloudflare/switch.log
        exit 0
else
#Start check if in backup mode
if [ -f /root/cloudflare/backupactive ];
then
    echo "already in backup mode!"
    exit 0
fi
cd /root/cloudflare

echo "Switching to backup..."
touch /root/cloudflare/backupactive

curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"$record_name\",\"content\":\"$ip\"}"


echo `date` going down! >> /root/cloudflare/logs/switch.log
fi
exit 0
