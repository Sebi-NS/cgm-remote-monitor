#!/bin/bash

set -e
set -u

#API_SECRET="1234567890ab"
API_SECRET="9080e79e67d92bd09c8a498a380190cdb4595072"

function queryRemoteCommands(){
  curl -g -X GET 'localhost:1337/api/v1/remotecommands.json?find[created_at][$gte]=2022-08-05T23:12:26.222Z' \
     -H "api-secret: $API_SECRET"
}

function postRemoteCommands(){
  curl -X POST localhost:1337/api/v1/remotecommands \
     -H 'Content-Type: application/json' \
     -H "api-secret: $API_SECRET" \
     -d '{"name":"Bills","created_at":"2018-12-16T01:00:52Z"}'
}

function putRemoteCommands(){
  curl -X PUT localhost:1337/api/v1/remotecommands \
     -H 'Content-Type: application/json' \
     -H "api-secret: $API_SECRET" \
     -d '{"name":"Billss", "_id": "62ed8aa080a2d56381aea089"}'
     #-d '{"name":"Billss","created_at":"2018-12-16T01:00:52Z", "_id": "62ed727a80a2d56381aea080"}'
}

# Check if the function exists
  if [ $# -gt 0 ]; then 
#if declare -f "$1" > /dev/null
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "Functions Available:"
  typeset -f | awk '!/^main[ (]/ && /^[^ {}]+ *\(\)/ { gsub(/[()]/, "", $1); print $1}'
  exit 1
fi
