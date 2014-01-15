#!/bin/bash

# need to remove "." dirs...
#find .  -maxdepth 1  -type d | xargs -L 1 bash -c 'cd "$0" && b=`basename $0` && echo "cd $b; docker build -rm -t=joe/$b .; cd .."'

cd ubuntu-13.10; docker build -rm -t=joe/ubuntu-13.10 .; cd ..

cd kitchensink; docker build -rm -t=joe/kitchensink .; cd ..
cd withhome; docker build -rm -t=joe/withhome .; cd ..

cd postfix; docker build -rm -t=joe/postfix .; cd ..
cd roundcube; docker build -rm -t=joe/roundcube .; cd ..
cd dovecot; docker build -rm -t=joe/dovecot .; cd ..



