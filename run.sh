#!/bin/bash
IMAGE_NAME="oddballness_task_image"
CONTAINER_NAME="oddballness_task_container"

docker build -t "$IMAGE_NAME" .
docker run -d -t --name "$CONTAINER_NAME" "$IMAGE_NAME" 
