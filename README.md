# JupyterOpenAI
Repo containing a docker-based setup for Jupyter Notebooks and OpenAI, including the setup and configurations required for using SAP BTP's OpenAI Proxy Service.

## Running the Image

The image is made available on [Docker Hub](https://hub.docker.com/repository/docker/fwinkler79/jupyter-openai/general).

To run it, you can use the following script:

```shell
#!/bin/zsh
echo "Running Jupyter Server. Access it from http://localhost:8888" and pass in the token found in the CMD output.

BTP_LLM_API_BASE='<URL of OpenAI Proxy Server>'
BTP_LLM_AUTH_URL='<URL of UAA authentication endpoint for OpenAI Proxy Server'
BTP_LLM_CLIENT_ID='<your client ID>'
BTP_LLM_CLIENT_SECRET='<your client secret>'

docker container rm jupyter
docker run -v $(pwd)/notebooks:/home/jovyan/notebooks -p 8888:8888 -e BTP_LLM_AUTH_URL=$BTP_LLM_AUTH_URL -e BTP_LLM_API_BASE=$BTP_LLM_API_BASE -e BTP_LLM_CLIENT_ID=$BTP_LLM_CLIENT_ID -e BTP_LLM_CLIENT_SECRET=$BTP_LLM_CLIENT_SECRET -t --name jupyter fwinkler79/jupyter-openai:latest
```
See also: [run.sh](run.sh)


