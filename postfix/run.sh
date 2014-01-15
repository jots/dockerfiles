# first time:
#get the ip: docker inspect $id
#ssh-copy-id joe@$ip
# there was got to be a better way...

CID=$(docker run -h newsletter -d -p 25:25 -p 587:587 -p 9001:9001 jots/postfix); 
echo ${CID}
docker inspect -format '{{ .NetworkSettings.IPAddress }}' ${CID}
