# dns-failover-cloudflare-monit
Setup DNS Failover for Cloudflare with monit


## How does it work ?

Best configuration requires 3 servers : primary webserver, secondary webserver and monit server. Still works with only two servers.

Cloudflare DNS is configured to redirect internet traffic to  the primary webserver. 

Monit is constantly checking health of primary webserver. 

If primary webserver stops responding to ping requests, monit will launch a script. The script will modifiy Cloudflare DNS entry to redirect traffic to second webserver.

Once primary webserver responds to ping again, a second script will be started and Cloudflare DNS entry will be updated to redirect traffic to primary webserver.


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
