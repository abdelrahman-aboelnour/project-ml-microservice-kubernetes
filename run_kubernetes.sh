#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="abdelrahmanaboelnour/k8sproject:latest"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy flask-app --image=$dockerpath


# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
POD=$(kubectl get pods | awk '/Running/{print $1;exit}')
kubectl port-forward $POD --address 0.0.0.0 8000:80
