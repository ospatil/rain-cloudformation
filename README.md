# Rain CloudFormation Experiments

Experimentation with [Rain](https://github.com/aws-cloudformation/rain) - a CloudFormation workflow tool.

## Pre-requisites

1. Rain - install using `brew install rain`
2. NodeJS 20
3. Python 3.12
4. AWS CLI

## Goals

Primary goals of the experimentation:

* Multi-module deployments with multiple CloudFormation Stacks
  * [mod-main.yaml](./arch/mod-main.yaml)
* Easy deployments of lambda functions
  * [TypeScript Lambda](./arch/ts-lambda.yaml)
  * [Python Lambda](./arch/py-lambda.yaml)
* Structure of lambdas for easy deployments
  * TypeScript - correct `tsconfig` settings and bundling the code into a single file along with dependencies using `esbuild`
  * Python - Directory structure for installing dependencies and create a layer

## Usage

Check the following main targets of the [Makefile](./Makefile) and their target dependencies for usage of various commands.

* `make deploy-multi-mod`: deploys multi-module stacks
* `make deploy-ts-lambda`: packages and deploys MiddyJS-based TypeScript NodeJS 20.x lambda. Test the lambda invocation using `make test-ts-lambda`
* `make deploy-py-lambda`: packages dependencies layers and deploys Python 3.12 lambda. Test the lambda invocation using `make test-py-lambda`

> <https://how.wtf/a-guide-for-deploying-cloudformation-with-cli-using-rain.html> is a good introductory article on Rain.
