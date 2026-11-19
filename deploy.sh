#!/usr/bin/env sh

#------------------------------------------------------------------------------
# @file
# Builds a Hugo project and deploys it to a web server with Rsync.
#------------------------------------------------------------------------------

# Exit on error or undefined variables
set -eu

ENV_FILE=".env"
if [ "${1:-}" = "--dev" ]; then
  ENV_FILE=".env.dev"
fi
if [ ! -f "$ENV_FILE" ]; then
  echo "missing $ENV_FILE" >&2
  exit 1
fi
set -a
# shellcheck disable=SC1090
. "./$ENV_FILE"
set +a
echo "Deploying to ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}"

SSH_USER="${DEPLOY_USER}"
SSH_HOST="${DEPLOY_HOST}"
SSH_PORT="22"
SRC="public/"
DEST="${DEPLOY_PATH}"

# Build
hugo build \
  --cleanDestinationDir \
  --gc \
  --minify

# Run pagefind
npx pagefind --site public

# Deploy
rsync \
  --checksum \
  --compress \
  --delete \
  --perms \
  --recursive \
  --rsh="ssh -p ${SSH_PORT}" \
  --verbose \
  "${SRC}" "${SSH_USER}@${SSH_HOST}:${DEST}"