# dns-failover-cloudflare-monit
Setup DNS Failover for Cloudflare with monit


## How does it work ?

Best configuration requires 3 servers : primary, secondary and monit server. Still works with only two servers.

Cloudflare DNS is configured to redirect internet traffic to  the primary server. 

Monit is constantly checking health of primary server. 

If primary web server stops to respond to ping, monit will launch a script. That script will modifiy CLoudflare DNS entry to redirect traffic to second webserver.

Once primary webserver responds to ping again, Cloudflare DNS entry will be modified again


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
Originally created by [Slayerduck] (http://blog.booru.org/?p=12) and modified by [myself] (https://www.noobunbox.net) to make it work with the lastest [cloudflare API] (https://api.cloudflare.com) (v4)


## Licence
MIT Licence
