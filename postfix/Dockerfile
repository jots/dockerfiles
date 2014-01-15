from jots/ubuntu-13.10
# based on https://github.com/noteed/docker-postfix
maintainer Joe McDonald <joe@vpop.net>

run echo mail > /etc/hostname
add etc-hosts.txt /etc/hosts
run chown root:root /etc/hosts

# Install Postfix.
run echo "postfix postfix/main_mailer_type string Internet site" > preseed.txt
run echo "postfix postfix/mailname string mail.example.com" >> preseed.txt
# Use Mailbox format.
run debconf-set-selections preseed.txt
ENV DEBIAN_FRONTEND noninteractive

run apt-get install -q -y postfix
run apt-get install -y mailutils opendkim opendkim-tools

run postconf -e myhostname=mail.example.com
run postconf -e mydestination="mail.example.com, example.com, localhost.localdomain, localhost"
run postconf -e mail_spool_directory="/var/spool/mail/"
run postconf -e mailbox_command=""

# Add a local user to receive mail at someone@example.com, with a delivery directory
# (for the Mailbox format).
run useradd -s /bin/bash someone
run mkdir /var/spool/mail/someone
run chown someone:mail /var/spool/mail/someone

add etc-aliases.txt /etc/aliases
run chown root:root /etc/aliases
run newaliases

# Use syslog-ng to get Postfix logs (rsyslog uses upstart which does not seem
# to run within Docker).
# syslog-ng no workie on 13.10: 
# https://bugs.launchpad.net/ubuntu/+source/syslog-ng/+bug/1242173
#run apt-get install -y syslog-ng

# so let's try rsyslog... I think it needs crond
run apt-get install -y rsyslog

ADD supervisord-crond.conf /etc/supervisor/conf.d/
ADD supervisord-rsyslogd.conf /etc/supervisor/conf.d/
ADD supervisord-postfix.conf /etc/supervisor/conf.d/

# mail, ssh, supervisord-web
expose 25 587 22 9001
CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf


#cmd ["sh", "-c", "service syslog-ng start ; service postfix start ; tail -F /var/log/mail.log"]
