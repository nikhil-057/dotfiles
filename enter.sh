#!/usr/bin/env bash
set -euo pipefail

if ! docker container inspect devbox &>/dev/null; then
  "$(dirname "$0")/bootstrap.sh"
else
  docker start devbox &>/dev/null
  "$(dirname "$0")/connect.sh"
fi
