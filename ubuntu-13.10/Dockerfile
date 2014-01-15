# ubuntu-13.10-sshd
# VERSION               0.0.4

# https://index.docker.io/u/lgsd/saucy/
FROM lgsd/saucy
MAINTAINER Joseph McDonald  "joe@vpop.net"

# problem with upstart...
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

# no mtab, so do this to see filesystems
RUn ln -s  /proc/self/mounts  /etc/mtab


ENV DEBIAN_FRONTEND noninteractive
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN (locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales)
RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
RUN (apt-get install -y -q nano && echo 'root:pass' |chpasswd )

# tools
RUN apt-get install -y ntp telnet emacs24-nox vim tmux python-pip htop psmisc

# for add-apt-repository
RUN apt-get install -y python-software-properties software-properties-common
RUN apt-get install -y debconf-utils

# supervisord
RUN mkdir -p /var/log/supervisor
RUN apt-get install -y supervisor
ADD  supervisord.conf /etc/supervisor/

# ssh
RUN (apt-get install -y -q openssh-server && mkdir -p /var/run/sshd)
RUN (sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config)
ADD  supervisord-sshd.conf /etc/supervisor/conf.d/


# copy over dotfiles from github

# expose and start
EXPOSE 22 9001
CMD     /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 

