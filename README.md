# dns-failover-cloudflare-monit
Setup DNS Failover for Cloudflare with monit


- Move cloudflare directory to root folder
- Create a directory named logs in /root/cloudflare/
- Replace all variables in tomain.sh and tobackup.sh according to your cloudflare configuration and servers configuration
- edit yourwebsite.com, yourwebsiteip, your.email@domain.tld, http://yourwebsite.com in monit_conf/cloudflare.conf
- move cloudflare.conf into /etc/monit/conf.d
- restart monit
- enjoy 
