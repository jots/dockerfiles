#!/bin/bash

# need to remove "." dirs...
#find .  -maxdepth 1  -type d | xargs -L 1 bash -c 'cd "$0" && b=`basename $0` && echo "cd $b; docker build -rm -tjoe/$b .; cd .."'

cd ubuntu-13.10; docker build -rm -tjoe/ubuntu-13.10 .; cd ..

cd kitchensink; docker build -rm -tjoe/kitchensink .; cd ..
cd withhome; docker build -rm -tjoe/withhome .; cd ..

cd postfix; docker build -rm -tjoe/postfix .; cd ..
cd roundcube; docker build -rm -tjoe/roundcube .; cd ..
cd dovecot; docker build -rm -tjoe/dovecot .; cd ..



