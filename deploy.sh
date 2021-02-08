echo $CIRCLE_PROJECT_REPONAME
cd $CIRCLE_PROJECT_REPONAME
pwd
git pull
mkdir -p ../docker-compose

envsubst < docker-compose-template.yml > docker-compose-$CIRCLE_PROJECT_REPONAME.yml
cp docker-compose-$CIRCLE_PROJECT_REPONAME.yml ../docker-compose

cd ../docker-compose
FILENAME=`ls ./*.yml`
FILE="docker-compose"
for EACHFILE in $FILENAME
do
   FILE+=" -f "+$EACHFILE
done
$FILE+=" up"

sh -c $FILE
