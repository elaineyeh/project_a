git pull

mkdir docker-compose
envsubst < docker-compose-template > docker-compose-$CIRCLE_PROJECT_REPONAME.yml
cp docker-compose-$CIRCLE_PROJECT_REPONAME.yml ../docker-compose

cd ../docker-compose
FILENAME=`ls ./*.yml`
FILE="docker-compose"
for EACHFILE in $FILENAME
do
   $FILE+=" -f "+$EACHFILE
done
$FILE+=" up"

sh -c $FILE
