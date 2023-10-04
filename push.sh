#!/bin/bash

. .env

# Login to registry
echo ""
echo "Logging in to $REGISTRY ..."
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin $REGISTRY


# Create registry if it does not exist
REGISTRY_COUNT=$(aws ecr describe-repositories | grep ${IMAGE} | wc -l)
if [ "$REGISTRY_COUNT" == "0" ]; then
        echo ""
        echo "Creating repository ${IMAGE} ..."
        aws ecr create-repository --repository-name ${IMAGE}
fi

# Push image
echo ""

echo "Pushing image ${REGISTRY}${IMAGE}${TAG}"
docker image push ${REGISTRY}${IMAGE}${TAG}

