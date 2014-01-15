dockerfiles
===========

dockerfiles for various things

root password is "pass"  don't forget to change it!

####TODO
- dovecot conf files (and get dsync/imapc working)
- link dovecot and roundcube
- should each of these have their own git repo?
- and much much more...

###Misc junk
# deletes all stopped containers
# will try to stop running ones, but will fail on those
docker rm $(docker ps -a -q)

# make image of docker tree
docker images -viz | dot -Tpng -o docker.png


