terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

locals {
  tags = {
    component = "lambda-benchmark"
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "test_lambda_role" {
  name               = "test_lambda_python"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = local.tags
}

data "archive_file" "test_lambda_python_package" {
  type        = "zip"
  source_file = "${path.root}/test_lambda_python/lambda_function.py"
  output_path = "test_lambda_python.zip"
}

data "archive_file" "test_lambda_java_package" {
  type        = "zip"
  source_dir  = "${path.root}/test_lambda_java"
  output_path = "test_lambda_java.zip"
}

resource "aws_lambda_function" "test_lambda_python_function" {
  function_name    = "test_lambda_python"
  filename         = "test_lambda_python.zip"
  source_code_hash = data.archive_file.test_lambda_python_package.output_base64sha256
  role             = aws_iam_role.test_lambda_role.arn
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
  memory_size      = 1024
  tags             = local.tags
}

resource "aws_lambda_function" "test_lambda_java_function" {
  function_name = "test_lambda_java"
  filename      = "test_lambda_java/target/java-basic-1.0-SNAPSHOT-jar-with-dependencies.jar"
  role          = aws_iam_role.test_lambda_role.arn
  runtime       = "java21"
  handler       = "example.Handler::handleRequest"
  timeout       = 10
  memory_size   = 1024
  tags          = local.tags
}
