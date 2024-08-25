#!/bin/bash

pushd terraform
  terraform plan --destroy && terraform apply --destroy -auto-approve
popd
