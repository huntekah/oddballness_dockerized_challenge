#!/bin/bash
IMAGE_NAME="oddballness_task_image"
CONTAINER_NAME="oddballness_task_container"
COMPLEXITY=20

docker build -t "$IMAGE_NAME" .
docker run -d -t --name "$CONTAINER_NAME" "$IMAGE_NAME" 
#CD to scripts dir. run script
docker exec "$CONTAINER_NAME" "/bin/sh" -c "cd /root/workspace/MastersThesis; . venv/bin/activate; cd scripts; ./run_exhaustive_gpt2_all.sh $COMPLEXITY"
