#!/bin/bash

zone_identifier=zone_identifier
record_identifier=record_identifier
auth_key=api_key
auth_email=your_cloudflare_email
ip=main_ip
record_name=record_name

if [ ! -f /root/cloudflare/backupactive ];
then
	echo "Server is not in backup mode, can't switch back to main" && exit 0
fi
cd /root/cloudflare

curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"$record_name\",\"content\":\"$ip\"}"


echo `date` going up! >> /root/cloudflare/logs/switch.log
rm -f /root/cloudflare/backupactive
