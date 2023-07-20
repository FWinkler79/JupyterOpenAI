#!/bin/bash

ARTIFACTORY_USER=$(cat '/run/secrets/ARTIFACTORY_USER')
ARTIFACTORY_PASSWORD=$(cat '/run/secrets/ARTIFACTORY_PASSWORD')

echo "Using following Artifactoy credentials:"
echo "- Artifactory User: $ARTIFACTORY_USER" 
echo "- Artifactory Password: $ARTIFACTORY_PASSWORD" 

mamba install --yes \
    'langchain' \
    'openai' \
    'chromadb' && \
    pip install --extra-index-url https://${ARTIFACTORY_USER}:${ARTIFACTORY_PASSWORD}@common.repositories.cloud.sap/artifactory/api/pypi/deploy-releases-hyperspace-pypi/simple/ sap-llm-commons[all] && \
    mamba clean --all -f -y