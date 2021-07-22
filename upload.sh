set -x
set -e
ECR_URL=741704045536.dkr.ecr.ap-northeast-2.amazonaws.com
SERVICE_NAME=fs-invoice-service
ECS_SERVICE_NAME=fs-invoice-service
DOCKER_FILE_NAME=Dockerfile

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin ${ECR_URL}
VERSION=$(grep -E "version" package.json | cut -d "\"" -f4)
docker build -f ${DOCKER_FILE_NAME} -t ${SERVICE_NAME} .
docker tag ${SERVICE_NAME}:latest ${ECR_URL}/${SERVICE_NAME}:latest
docker tag "$SERVICE_NAME":latest "$ECR_URL"/"$SERVICE_NAME":$VERSION
docker push ${ECR_URL}/${SERVICE_NAME}:latest
docker push ${ECR_URL}/${SERVICE_NAME}:$VERSION

aws --region ap-northeast-2 ecs update-service --cluster sfn-dev --service ${ECS_SERVICE_NAME} --force-new-deployment >> aws.log

docker rmi $(docker images | grep "$SERVICE_NAME" | tr -s ' ' | cut -d ' ' -f 3) -f