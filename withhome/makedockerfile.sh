#!/bin/dash
cat >Dockerfile <<EOF
# change to kitchen sink...
FROM    joe/ks
MAINTAINER Joe McDonald <joe@vpop.net>

# get yourself into the system
# if you want all users on the system, modify...
RUN echo $(getent passwd $(id -u)) >> /etc/passwd
RUN echo $(getent group $(id -g)) >> /etc/group
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/$USER
RUN chmod 0440 /etc/sudoers.d/$USER

EXPOSE  22 80 9001
CMD     /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 
EOF

