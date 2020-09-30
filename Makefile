.PHONY: build clean deploy check_clean

build:
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

deploy-dev: clean build
	sls deploy -v -r ap-southeast-2 -s dev

invoke-dev:
	sls invoke -f hello -s dev
	sls invoke -f world -s dev

deploy-prd: clean build
	sls deploy -v -r ap-southeast-2 -s prd

invoke-prd:
	sls invoke -f hello -s prd
	sls invoke -f world -s prd

clean: check_clean
	rm -rf ./bin

check-clean:
	@echo "Are you sure? [y/N] " && read ans && [ $${ans:-N} == y ]
    