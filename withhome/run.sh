# first time:
#get the ip: docker inspect $id
#ssh-copy-id joe@$ip
# there was got to be a better way...

CID=$(docker run -h docker-joe -d -v  $HOME:$HOME joe/withhome); 
echo ${CID}
docker inspect -format '{{ .NetworkSettings.IPAddress }}' ${CID}
