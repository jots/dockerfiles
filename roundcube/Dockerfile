FROM    joe/ubuntu-13.10
MAINTAINER Joe McDonald <joe@vpop.net>
# based on https://github.com/Joeboy/dockerfiles
# NB: You should change your db passwords in the selections file

ADD     ./selections /selections
RUN     cat /selections | debconf-set-selections && rm /selections
ENV     APACHE_RUN_USER www-data
ENV     APACHE_RUN_GROUP www-data
ENV     APACHE_LOG_DIR /var/log/apache2
ENV     APACHE_PID_FILE    /var/run/apache2.pid
ENV     APACHE_RUN_DIR     /var/run/apache2
ENV     APACHE_LOCK_DIR    /var/lock/apache2
ENV     LANG               C

RUN     apt-get -y install mysql-server mysql-server-5.5 python-pip apache2-mpm-prefork
RUN     mysqld & sleep 5; apt-get -y install roundcube roundcube-plugins #roundcube-plugins-extra
ADD     roundcube.conf /etc/supervisor/conf.d/roundcube.conf
RUN     ln -s /var/lib/roundcube /var/www/roundcube
RUN     sed -i 's/ar_SA/en_US/' /var/lib/roundcube/config/main.inc.php

# http://stackoverflow.com/questions/19446679/mcrypt-not-present-after-ubuntu-upgrade-to-13-10
# XXX bug...
RUN ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
RUN php5enmod mcrypt

EXPOSE  22 80 9001
CMD     /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf 


