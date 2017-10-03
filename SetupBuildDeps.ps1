"creating powershell profile"
New-item –type file –force $profile

"Installing chocolatey package manager"
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

"Installing dotnet core sdk"
choco install dotnetcore-sdk -y

"Installing node and npm"
choco install nodejs.install -y

"adding NPM to system variables"
[Environment]::SetEnvironmentVariable("npm", "C:\Program Files\nodejs\npm.cmd", "Machine")

"adding dotnet to system variables"
[Environment]::SetEnvironmentVariable("dotnet", "C:\Program Files\dotnet\dotnet.exe", "Machine")

# finally refresh environment using chocolatey's script
refreshenv