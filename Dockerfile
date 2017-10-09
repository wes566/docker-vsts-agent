# using .net3.5 image becuase webdeploy.exe needs .NET 3.5 and
# starting with 3.5 base image seems easiest way to do that
FROM microsoft/dotnet-framework:3.5-windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# create powershell profile
# install chocolatey
# refresh profile so chocolatey stuff is included
# install both sdk 2.0 and 1.0.4 (even though choco version is 1.1.2 it's the 1.0.4 sdk)
# node/npm
# add some system variables
# make sure environment variables are fresh
# install .NET Framework so msdeploy.exe works
RUN New-Item -ItemType File -Force $profile -Value '#creating an empty profile so chocolatey refreshenv will work'; \
    Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    . $profile; \
    choco install dotnetcore-sdk -y; \
    choco install dotnetcore-sdk --version 1.1.2 --force -y; \
    choco install nodejs.install -y; \
    [Environment]::SetEnvironmentVariable('npm', 'C:\Program Files\nodejs\npm.cmd', 'Machine'); \
    [Environment]::SetEnvironmentVariable('dotnet', 'C:\Program Files\dotnet\dotnet.exe', 'Machine'); \
    refreshenv;

# copy over agent start scripts
RUN mkdir C:\BuildAgent
WORKDIR C:/BuildAgent
COPY ./Start.* ./

CMD ["Start.cmd"]