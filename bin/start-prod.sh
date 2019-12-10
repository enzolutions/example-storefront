#!/usr/bin/env sh

set -o errexit  # always exit on error
set -o pipefail # don't ignore exit codes when piping output
# set -x          # enable debugging

IFS="$(printf "\n\t")"

cd "$(dirname "$0")/.."
printf "Creating hydra client…"
./bin/wait-for.sh "${OAUTH2_HOST}:${OAUTH2_ADMIN_PORT}"
./bin/create-hydra-client.js
node .
