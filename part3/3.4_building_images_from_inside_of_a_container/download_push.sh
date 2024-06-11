#!/bin/bash

# Check for missing parameters
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_git_repo> <target_docker_hub_repo>"
    exit 1
fi

SOURCE_GIT_REPO=$1
TARGET_DOCKER_HUB_REPO=$2

echo "Cloning $SOURCE_GIT_REPO..."
git clone $SOURCE_GIT_REPO

# Extract the repository name from the GitHub URL
repo_name="${SOURCE_GIT_REPO##*/}"  # Remove everything before the last slash
repo_name="${repo_name%.git}"  # Remove the .git suffix

echo "Building Docker image from $repo_name..."
cd $repo_name
docker build -t $TARGET_DOCKER_HUB_REPO .

echo "Logging in to Docker..."
echo "$DOCKER_PWD" | docker login --username $DOCKER_USER --password-stdin || { echo 'Docker login failed'; exit 1; }

echo "Pushing image to Docker Hub..."
docker push $TARGET_DOCKER_HUB_REPO

echo "Process completed successfully."

echo "Cleaning up..."
cd ..
rm -rf $repo_name
