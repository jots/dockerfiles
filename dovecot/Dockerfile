# dovecot
# VERSION               0.0.4

# https://index.docker.io/u/lgsd/saucy/
FROM joe/ubuntu-13.10
MAINTAINER Joseph McDonald  "joe@vpop.net"

RUN add-apt-repository -y ppa:bigmichi1/dovecot
RUN apt-get update
RUN apt-get -y install ntp dovecot-imapd dovecot-pop3d dovecot-sqlite dovecot-solr

ADD  dovecot.conf /etc/supervisor/conf.d/dovecot.conf

VOLUME ["/dockervols"]

EXPOSE 22 143 993 9001
CMD     /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf 

