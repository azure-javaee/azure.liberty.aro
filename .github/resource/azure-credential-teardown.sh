#!/usr/bin/env bash
# Copyright (c) IBM Corporation.
# Copyright (c) Microsoft Corporation.

set -Eeuo pipefail

echo "Execute azure-credential-teardown.sh - Start------------------------------------------"

gh secret delete "AZURE_CREDENTIALS"
AZURE_CREDENTIALS_SP_NAME=$(gh variable get "AZURE_CREDENTIALS_SP_NAME")
az ad sp delete --id $(az ad sp list --display-name $AZURE_CREDENTIALS_SP_NAME --query "[].appId" -o tsv| tr -d '\r\n')

echo "Execute azure-credential-teardown.sh - End--------------------------------------------"