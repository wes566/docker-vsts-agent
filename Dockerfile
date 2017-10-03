FROM microsoft/windowsservercore:10.0.14393.1358
ENV WINDOWS_IMAGE_VERSION=10.0.14393

RUN mkdir C:\BuildAgent
WORKDIR C:/BuildAgent
COPY ./Start.* ./
COPY ./SetupBuildDeps.ps1 ./

CMD ["Start.cmd"]