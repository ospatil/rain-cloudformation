clean-ts-lambda:
	rm -rf ./middy-lambda/dist

npm-install-ts-lambda:
	cd middy-lambda && npm i

build-ts-lambda: clean-ts-lambda npm-install-ts-lambda
	cd middy-lambda && npm run esbuild

pkg-ts-lambda: build-ts-lambda
	rain pkg ./arch/ts-lambda.yaml -o ./arch/dist/ts-lambda.yaml

deploy-ts-lambda: pkg-ts-lambda
	rain deploy ./arch/dist/ts-lambda.yaml rain-ts-lambda-stack

test-ts-lambda:
	aws lambda invoke --function-name TsLambdaFunction ts-response.txt && cat ts-response.txt

pkg-multi-mod:
	rain pkg ./arch/mod-main.yaml -o ./arch/dist/mod-main.yaml

deploy-multi-mod: pkg-multi-mod
	rain deploy ./arch/dist/mod-main.yaml rain-modules-stack

install-pydeps:
	python -m pip install --target ./py-lambda/package/python pyjokes --upgrade

pkg-py-lambda: install-pydeps
	rain pkg ./arch/py-lambda.yaml -o ./arch/dist/py-lambda.yaml

deploy-py-lambda: pkg-py-lambda
	rain deploy ./arch/dist/py-lambda.yaml rain-py-lambda-stack

test-py-lambda:
	aws lambda invoke --function-name PyLambdaFunction py-response.txt && cat py-response.txt

# to delete any stack: rain delete <stack-name>
