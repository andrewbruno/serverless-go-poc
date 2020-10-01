## STAGE is only used for naming convensions
## e.g. To deploy with prd naming convention, use make STAGE=prd deploy
##
## Ensure you set the correct AWS environment security credetials first!
##
STAGE ?= local
AWS_PROFILE ?= localstack

env-echo:
	@echo 'Stage is: ${STAGE}'
	@echo 'AWS_PROFILE is: ${AWS_PROFILE}'

build:
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

deploy: clean build
	sls deploy -v -r ap-southeast-2 -s $(STAGE)

invoke:
	sls invoke -f hello -s $(STAGE)
	sls invoke -f world -s $(STAGE)

remove: _check
	sls remove -r ap-southeast-2 -s $(STAGE)

clean: _check
	rm -rf ./bin ./serverless

_check:
	@echo "Are you sure? [y/N] " && read ans && [ $${ans:-N} == y ]

.PHONY: env-echo build deploy invoke remove clean _check
