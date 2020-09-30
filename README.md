# serverless-go-poc

Before running make, ensure you have set your correct AWS_PROFILE!!

Check you environment settings:

```
set | grep AWS
```

# Steps

## Build
```
make build
```

## Deploy DEV

To deploy, ensure you set your AWS profile to the environment you wish to deploy to:

e.g. for dev:

```
export AWS_PROFILE=purple4
make deploy-dev
```

## Deploy PRD

e.g. for prd:

```
export AWS_PROFILE=yellow5
make deploy-prd
```

## Test DEV

To test the deployed tst functions:
```
make invoke-tst
```

## Test PRD

To test the deployed prd functions:
```
make invoke-prd
```

## Remove DEV

```
export AWS_PROFILE=purple4
make remove-dev
```

## Remove PRD

```
export AWS_PROFILE=yellow5
make remove-prd
```


## Background

This project was initially created via 
```
sls create --template aws-go --path serverless-go-poc
```

ref: https://www.serverless.com/framework/docs/providers/aws/examples/hello-world/go/

