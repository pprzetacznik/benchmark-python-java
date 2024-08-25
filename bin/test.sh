#!/bin/bash

SCRIPT_PATH="$(dirname "$(realpath $0)")"
TEST_LAMBDA_JAVA_PATH=$SCRIPT_PATH/../terraform/test_lambda_java/src/main/java/example
TEST_LAMBDA_JAVA_JAR_PATH=$SCRIPT_PATH/../terraform/test_lambda_java/target/java-basic-1.0-SNAPSHOT-jar-with-dependencies.jar

echo "########################################"
echo "TEST JAVA - only run"
pushd $TEST_LAMBDA_JAVA_PATH 2>/dev/null 1>&2
  time java SpeedTest.java
popd

echo "########################################"
echo "TEST JAVA - compile and run"
pushd $TEST_LAMBDA_JAVA_PATH/.. 2>/dev/null 1>&2
  javac example/SpeedTest.java
  time java example.SpeedTest
popd

echo "########################################"
echo "TEST JAVA - with compilation"
pushd $TEST_LAMBDA_JAVA_PATH/.. 2>/dev/null 1>&2
  time javac example/SpeedTest.java && java example.SpeedTest
popd

echo "########################################"
echo "TEST JAVA - with Jar"
time java -jar $TEST_LAMBDA_JAVA_JAR_PATH example.SpeedTest

echo "########################################"
echo "TEST PYTHON"
pushd terraform/test_lambda_python 2>/dev/null 1>&2
time python3 lambda_function.py
