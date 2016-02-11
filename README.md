# dns-failover-cloudflare-monit
Setup DNS Failover for Cloudflare with monit


## Installation
- Move cloudflare directory to root folder
- Create a directory named logs in /root/cloudflare/
- Replace all variables in tomain.sh and tobackup.sh according to your cloudflare configuration and servers configuration
- edit yourwebsite.com, yourwebsiteip, your.email@domain.tld, http://yourwebsite.com in monit_conf/cloudflare.conf
- move cloudflare.conf into /etc/monit/conf.d
- restart monit
- enjoy 

Full installation instructions in french available [here] (https://www.noobunbox.net/serveur/configurer-un-dns-failover-cloudflare)


## Source
Originally created by [roofer] (http://blog.booru.org/?p=12) and modified by myself to make it work with the lastest [cloudflare API] (https://api.cloudflare.com) (v4)


## Licence
MIT Licence
