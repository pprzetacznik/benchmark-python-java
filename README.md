# Benchmarking Python and Java

## Benchmarking locally

```
$ ./bin/test.sh
########################################
TEST JAVA - only run
TOTAL TIME = 0.257s
10000000

real    0m0.620s
user    0m1.982s
sys     0m0.144s
~/workspace/benchmarking
########################################
TEST JAVA - compile and run
TOTAL TIME = 0.209s
10000000

real    0m0.252s
user    0m1.113s
sys     0m0.115s
~/workspace/benchmarking
########################################
TEST JAVA - with compilation

real    0m0.324s
user    0m0.716s
sys     0m0.031s
TOTAL TIME = 0.21s
10000000
~/workspace/benchmarking
########################################
TEST JAVA - with Jar
TOTAL TIME = 0.209s
10000000

real    0m0.265s
user    0m1.141s
sys     0m0.119s
########################################
TEST PYTHON
TOTAL TIME = 0.28s
10000000

real    0m0.363s
user    0m0.281s
sys     0m0.074s
```

## Bencharking on AWS Lambda

```
$ ./bin/deploy.sh
...
python version
{
    "StatusCode": 200,
    "ExecutedVersion": "$LATEST"
}

real    0m3.126s
user    0m0.260s
sys     0m0.088s
"TOTAL TIME = 2.29s\n10000000"
================

java version
{
    "StatusCode": 200,
    "ExecutedVersion": "$LATEST"
}

real    0m5.342s
user    0m0.268s
sys     0m0.089s
"TOTAL TIME = 4.223s\n10000000"
```

## AWS Setup

Generating API keys
```
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
```

## Destroying

```
$ ./bin/destroy.sh
```

## References

* https://stackoverflow.com/questions/918359/my-python-program-executes-faster-than-my-java-version-of-the-same-program-what
* https://github.com/awsdocs/aws-lambda-developer-guide/blob/main/sample-apps/java-basic/pom.xml
* https://github.com/TechEmpower/FrameworkBenchmarks/wiki/Project-Information-Framework-Tests-Overview#json-serialization
* https://just.billywhizz.io/blog/on-javascript-performance-01/
* https://highscalability.com/10-stack-benchmarking-dos-and-donts/
