"Installing chocolatey package manager"
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

"Installing dotnet core sdk"
choco install dotnetcore-sdk -y

