# lambda-builder

Builds a AWS python lambda function package using docker.

Takes one environment variable: REPO which points to the public repository containing the code to be packaged.

Package is placed in the /output folder.

## Install does the following steps

* pip install using requirements.txt
* copies all *.py files from the root of the repository
* runs `install.sh` if is present in the root of the repository

## How to run

```
docker run --rm -e REPO=<git url> -v <local folder where you want the output>:/output richardjkendall/lambda-builder
```
