# serverless-go-poc

Before running make, ensure you have set your correct AWS_PROFILE!!

Check you environment settings:

```
export AWS_PROFILE=purple4
set | grep AWS
```

# Steps

## Check ENV variables

```
make env-echo
```

Set your env variables, e.g.

```
export AWS_PROFILE=yellow5
export STAGE=yellow
```

## Build
```
make build
```

## Deploy

To deploy, ensure you set your AWS profile to the environment you wish to deploy to. For example, for `yellow`

```
export AWS_PROFILE=yellow5
make STAGE=yellow deploy
```

## Test by invoking deployed function

```
export AWS_PROFILE=ab-dev
make STAGE=dev invoke
```

## Remove

```
export AWS_PROFILE=purple4
make STAGE=purple remove
```

## Background

This project was initially created via 
```
sls create --template aws-go --path serverless-go-poc
```

ref: https://www.serverless.com/framework/docs/providers/aws/examples/hello-world/go/

