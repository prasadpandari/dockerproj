#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=prasadpandari/udacitymicro

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacitymicro --image=$dockerpath --port=80 --labels="app=udacitymicro"


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
POD_NAME=$(kubectl get pod -l app=udacitymicro -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8000:80


