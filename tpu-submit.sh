#!/bin/bash
JOB=food0909-full
JOB_FILE="test" #$(python3 savename.py $JOB)
# JOBSCRIPTS=jobs_tpu/0807
cat ./Dockerfile
PROJECT_ID= #ruse-xgcp #curriculum-study
#PROJECT_ID=curriculum-learning
TAG=latest
COINTAINER_NAME=exp-pt3
CONTAINER_IMAGE_URI=gcr.io/${PROJECT_ID}/${COINTAINER_NAME}:$TAG 
docker build -t ${COINTAINER_NAME} .
docker tag ${COINTAINER_NAME} ${CONTAINER_IMAGE_URI}
docker push ${CONTAINER_IMAGE_URI}
echo ${CONTAINER_IMAGE_URI}
# REGION=europe-west4  
REGION=us-central1
# GOOGLE_APPLICATION_CREDENTIALS="./test/curriculum-learning.json"
# --experiment_config $JOB_FILE
caliban cloud --image_tag ${CONTAINER_IMAGE_URI} --project_id $PROJECT_ID  --nogpu --tpu_spec 8xV3 --machine_type n1-standard-8 --region $REGION  run_training.sh  --
# docker system prune -a -f#!/bin/bash
