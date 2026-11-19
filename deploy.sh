#!/usr/bin/env sh

#------------------------------------------------------------------------------
# @file
# Builds a Hugo project and deploys it to a web server with Rsync.
#------------------------------------------------------------------------------

# Exit on error or undefined variables
set -eu
set -a && source .env && set +a

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
  --recursive \
  --rsh="ssh -p ${SSH_PORT}" \
  --verbose \
  "${SRC}" "${SSH_USER}@${SSH_HOST}:${DEST}"