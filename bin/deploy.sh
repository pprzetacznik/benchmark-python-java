#!/bin/bash

pushd terraform
  pushd test_lambda_java
    mvn clean package
  popd
  terraform plan && terraform apply -auto-approve
popd
./bin/test_aws.sh
