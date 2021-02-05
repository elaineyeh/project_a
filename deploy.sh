git pull
$PROJECT_NAME=a

mkdir docker-compose
envsubst < docker-compose-template > docker-compose-$PROJECT_NAME.yml
cp docker-compose-$PROJECT_NAME.yml ../docker-compose
