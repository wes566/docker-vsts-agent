# docker-vsts-agent-windows

Docker image for a Windows VSTS build agent. Based on https://github.com/Microsoft/vsts-agent-docker (with some different build tools in the image).

## How to run

```
docker run --restart unless-stopped -m 2gb --cpu-count 4 -e VSTS_ACCOUNT=<acct name> -e VSTS_TOKEN=<token> -e VSTS_AGENT=<agent name> wes566/docker-vsts-agent-windows
```

Note: I'm passing in explicit memory and cpu counts because if you are running docker in hyper-v isolation mode (which is default on Windows 10) then the default is 1GB and 2 CPUs and I want more than that for my build agent. I'm also passing in the restart flag so my container will restart if the host machine gets restarted.

## Local Development

### how to build

```
docker build -t docker-vsts-agent-windows .
```

### how to run (with restarting)

```
docker run --restart unless-stopped -m 2gb --cpu-count 4 -e VSTS_ACCOUNT=<acct name> -e VSTS_TOKEN=<token> -e VSTS_AGENT=<agent name> docker-vsts-agent-windows
```

### debugging vsts-agent

Set the `SKIP_START_AGENT` environment variable to anything and then the vsts-agent will not start listening

```
docker run -e SKIP_START_AGENT=foo -e VSTS_ACCOUNT=<acct name> -e VSTS_TOKEN=<token> -e VSTS_AGENT=<agent name> -it docker-vsts-agent-windows
```
