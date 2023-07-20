#!/bin/bash
btp_llm configure --auth-url $BTP_LLM_AUTH_URL --client-id $BTP_LLM_CLIENT_ID --client-secret $BTP_LLM_CLIENT_SECRET  --api-url $BTP_LLM_API_BASE
/usr/local/bin/start-notebook.sh
