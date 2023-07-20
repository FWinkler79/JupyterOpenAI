#!/bin/zsh
echo "Building Docker Image with Jupyter, langchain and OpenAI on board."

echo "Artifactory User:"
read ARTIFACTORY_USER
echo "Artifactory Password:"
read ARTIFACTORY_PASSWORD

export ARTIFACTORY_USER=$ARTIFACTORY_USER
export ARTIFACTORY_PASSWORD=$ARTIFACTORY_PASSWORD
export DOCKER_BUILDKIT=1

docker buildx build --secret id=ARTIFACTORY_USER --secret id=ARTIFACTORY_PASSWORD -t fwinkler79/jupyter-openai:latest .