#!/bin/bash

aws lambda list-functions

echo "python version"
time aws lambda invoke \
  --function-name test_lambda_python \
  --cli-binary-format raw-in-base64-out \
  --payload '{ "name": "Bob" }' \
  response.json
cat response.json

echo
echo "================"
echo
echo "java version"
time aws lambda invoke \
  --function-name test_lambda_java \
  --cli-binary-format raw-in-base64-out \
  --payload '{ "name": "Bob" }' \
  response.json
cat response.json
