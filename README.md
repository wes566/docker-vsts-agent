# docker-vsts-agent
Dockerfile for building windows vsts-agent

## how to build from repo
```
docker build https://github.com/wes566/docker-vsts-agent.git -t vsts_agent
```

## how to build locally
```
docker build -t vsts_agent .
```

## how to run (with restarting)
```
docker run --restart unless-stopped -e VSTS_ACCOUNT=<acct name> -e VSTS_TOKEN=<token> -e VSTS_AGENT=<agent name> vsts_agent
```

## debugging vsts-agent
Set the `SKIP_START_AGENT` environment variable to anything and then the vsts-agent will not start listening
```
docker run -e SKIP_START_AGENT=foo -e VSTS_ACCOUNT=<acct name> -e VSTS_TOKEN=<token> -e VSTS_AGENT=<agent name> -it vsts_agent
```