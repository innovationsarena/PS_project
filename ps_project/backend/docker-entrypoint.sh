#!/bin/sh
set -e

if [ -d /opt/admin-build ]; then
  mkdir -p /app/web/admin
  rm -rf /app/web/admin/*
  cp -a /opt/admin-build/. /app/web/admin/
fi

APP_BINARY_NAME="${APP_BINARY_NAME:-projektps}"
APP_BINARY_ENTRYPOINT="${APP_BINARY_ENTRYPOINT:-./cmd/server}"
BUILD_NUMBER="$(date -u +%Y%m%d.%H%M%S)"

go build \
  -o "${APP_BINARY_NAME}" \
  -buildvcs=false \
  -ldflags "-X main.serverrunner=GoDocker -X main.environment= -X main.buildnumber=${BUILD_NUMBER} -X main.buildgreeter=none -X main.buildtrigger=none" \
  "${APP_BINARY_ENTRYPOINT}"

exec "./${APP_BINARY_NAME}"
