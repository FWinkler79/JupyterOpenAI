FROM jupyter/base-notebook

# This is only needed if you are not using the BTP OpenAI Proxy Service.
# The BTP service proxies OpenAI APIs and provides an OpenAI API Key for you.
ENV OPENAI_API_KEY="UNDEFINED"

# See: https://github.tools.sap/AI-Playground-Projects/llm-commons/tree/main/docs/btp_llm
# These environment variables are read by the startup.sh script and will be used to configure the btp_llm library.
ENV BTP_LLM_CLIENT_ID="UNDEFINED"
ENV BTP_LLM_CLIENT_SECRET="UNDEFINED"
ENV BTP_LLM_AUTH_URL="UNDEFINED"
ENV BTP_LLM_API_BASE="UNDEFINED"

# See: https://pythonspeed.com/articles/docker-build-secrets/
# See: https://render.com/docs/docker-secrets#:~:text=Secret%20Files%20in%20Docker%20Builds&text=will%20print%20the%20content%20of,that%20requires%20the%20secret%20file.
USER root
COPY image-build-script.sh .
RUN --mount=type=secret,id=ARTIFACTORY_USER --mount=type=secret,id=ARTIFACTORY_PASSWORD ./image-build-script.sh

COPY startup.sh /usr/local/bin/startup.sh

CMD [ "startup.sh" ]